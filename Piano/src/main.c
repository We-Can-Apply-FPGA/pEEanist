#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>
#include <unistd.h>

char buffer[10000];
int rs232_fd;

int set_interface_attribs (int fd, int speed, int parity)
{
	struct termios tty;
	memset (&tty, 0, sizeof tty);
	if (tcgetattr (fd, &tty) != 0)
	{
		fprintf(stderr, "error %d from tcgetattr", errno);
		return -1;
	}

	cfsetospeed (&tty, speed);
	cfsetispeed (&tty, speed);

	tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
	// disable IGNBRK for mismatched speed tests; otherwise receive break
	// as \000 chars
	tty.c_iflag &= ~IGNBRK;         // disable break processing
	tty.c_lflag = 0;                // no signaling chars, no echo,
	// no canonical processing
	tty.c_oflag = 0;                // no remapping, no delays
	tty.c_cc[VMIN]  = 0;            // read doesn't block
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	tty.c_iflag &= ~(IXON | IXOFF | IXANY); // shut off xon/xoff ctrl

	tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
	// enable reading
	tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
	tty.c_cflag |= parity;
	tty.c_cflag &= ~CSTOPB;
	tty.c_cflag &= ~CRTSCTS;

	if (tcsetattr (fd, TCSANOW, &tty) != 0)
	{
		fprintf(stderr, "error %d from tcsetattr", errno);
		return -1;
	}
	return 0;
}

void set_blocking (int fd, int should_block)
{
	struct termios tty;
	memset (&tty, 0, sizeof tty);
	if (tcgetattr (fd, &tty) != 0)
	{
		fprintf(stderr, "error %d from tggetattr", errno);
		return;
	}

	tty.c_cc[VMIN]  = should_block ? 1 : 0;
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

	if (tcsetattr (fd, TCSANOW, &tty) != 0)
		fprintf(stderr, "error %d setting term attributes", errno);
}

void toggle_sound(int *array, int cnt, int go) {
	for (int i=0; i<cnt; i++) {
		printf("%d ", array[i]);
		sprintf(buffer, "%d\n", array[i]);
		write(rs232_fd, buffer, strlen(buffer));
	}
	if (go) {
		printf("\n");
		write(rs232_fd, "go\n", 3);
	}
}

int main() {
	rs232_fd = open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY);
	if (rs232_fd < 0) {
		fprintf(stderr, "RS232 error\n");
		exit(1);
	}
	set_interface_attribs(rs232_fd, B115200, 0);
	set_blocking(rs232_fd, 0);

	write(rs232_fd, "PCready\n", 8);
	printf("READY\n");
	while(1) {
		int array[2];
		array[0] = 0, array[1] = 1;
		toggle_sound(array, 2, 1);
		usleep(10000000);
	}
	/*
	   while(1) {
	   fprintf(rs232, "PC ready\n");
	   fgets(buffer, 10000, rs232);
	   if (strcmp(buffer, "DE2 ready") == 0) {
	   break;
	   }
	   }
	   */
	/*
	   int mode;
	   scanf("%d", &n);
	   switch (mode) {
	   case 1:
	   break;
	   case 2:
	   break;
	   }
	   */
	return 0;
}
