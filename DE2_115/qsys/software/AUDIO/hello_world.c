#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <io.h>
#include <unistd.h>
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "system.h"

//char buffer[1000];
//FILE *lcd, *rs232t, *rs232r;

//volatile int edge_capture;

/*static void fft_interrupts(void* context, alt_u32 id)
{
	volatile int* edge_capture_ptr = (volatile int*) context;
	*edge_capture_ptr = IORD(FFT_START_BASE, 3);

	int real = IORD(FFT_REAL_BASE, 0);
	int img = IORD(FFT_IMG_BASE, 0);
	int start = IORD(FFT_START_BASE, 0);
	int cnt = IORD(FFT_CNT_BASE, 0);


	fprintf(stderr, "irq");
	fprintf(stderr, "%d %d %d %d\n", real, img, start, cnt);
	fprintf(stderr, "%d %d\n", IORD(FFT_START_BASE, 2), IORD(FFT_START_BASE, 3));


	IOWR(FFT_START_BASE, 2, 1);
	IOWR(FFT_START_BASE, 3, 0);
}*/

void initial() {
	fprintf(stderr,"TEST");

	/*lcd = fopen(LCD_NAME, "w");
	if (!lcd) fprintf(stderr, "LCD failed\n");
	rs232t = fopen(RS232_NAME, "w");
	if (!rs232t) fprintf(stderr, "rs232t failed\n");
	rs232r = fopen(RS232_NAME, "r");
	if (!rs232r) fprintf(stderr, "rs232r failed\n");
	void* edge_capture_ptr = (void*) &edge_capture;
	IOWR(FFT_START_BASE, 3, 0);
	IOWR(FFT_START_BASE, 2, 1);
	alt_irq_register(FFT_START_IRQ, edge_capture_ptr, fft_interrupts);*/
}

//int tmp = IORD(PIO_INPUT_BASE, 0)
//IOWR(PIO_OUTPUT_BASE, 0, tmp);

int main(){
	fprintf(stderr,"TEST1");
	//initial();
	/*
	while (1) {
		fprintf(stderr, "output %d \n", IORD(DEBUG_BASE, 0) >> 16);
		usleep(100000);
	}
	*/
	return 0;
}
