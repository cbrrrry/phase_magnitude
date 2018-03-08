
/*HR_monitor.c 
Carson Berry, Abdo Elhosary, Jason Fakidis
Code to interpret the schmidt trigger-filtered signal of someone's HR through their finger. 
Should be coupled with a finger-sensor that utilizes IR radiation and it's differential absorbtion with a phototransistor
*/

// The next line clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <EFM8LB1.h>
#include <stdio.h>

#define SYSCLK      72000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps


#define LCD_RS P2_6
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_5
#define LCD_D4 P2_4
#define LCD_D5 P2_3

#define LCD_D6 P2_2
#define LCD_D7 P2_1

#define input P2_0 
#define CHARS_PER_LINE 16
#define sample_size 5
#define VDD 3.3035 // The measured value of VDD in volts
#define ref_logic_pin P2_0
#define	test_logic_pin P1_7


long int overflow_count;
char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN |= 0x80;
	RSTSRC = 0x02;

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif
	
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	return 0;
}



// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

void LCD_pulse (void)
{
	LCD_E=1;
	Timer3us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer3us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	// LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void LCDprint_inv(char * string, unsigned char line, bit clear)
{
	int j;
	int length=0;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	length++;
	for(j=length-1; j>=0; j--) WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}


int getsn (char * buff, int len)
{
	int j;
	char c;
	
	for(j=0; j<(len-1); j++)
	{
		c=getchar();
		if ( (c=='\n') || (c=='\r') )
		{
			buff[j]=0;
			return j;
		}
		else
		{
			buff[j]=c;
		}
	}
	buff[j]=0;
	return len;
}

void InitPinADC (unsigned char portno, unsigned char pin_num)
{
	unsigned char mask;
	
	mask=1<<pin_num;

	SFRPAGE = 0x20;
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
	SFRPAGE = 0x00;
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADBUSY=1;       // Dummy conversion first to select new pin
	while (ADBUSY); // Wait for dummy conversion to finish
	ADBUSY = 1;     // Convert voltage at the pin
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*VDD)/16383.0);
}

void InitADC (void)
{
	SFRPAGE = 0x00;
	ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	ADC0CF1 = 0b_0_0_011110; // Same as default for now
	ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	ADEN=1; // Enable ADC
}

float Get_Period_ref (void)
{
	float period=0;
			
			// Reset the counter
			TL0=0; 
			TH0=0;
			TF0=0;
			overflow_count=0;
					while(ref_logic_pin!=0); // Wait for the signal to be zero
					while(ref_logic_pin!=1); // Wait for the signal to be one		
					TR0=1; // Start the timer
					while(ref_logic_pin!=0) // Wait for the signal to be zero
					{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
					}
					while(ref_logic_pin!=1) // Wait for the signal to be one
					{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
					}
					TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
					period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;
		    	
		

	return period;

}

float Get_Period_test (void)
{
	float period=0;

			
			// Reset the counter
			TL0=0; 
			TH0=0;
			TF0=0;
			overflow_count=0;
					while(test_logic_pin!=0); // Wait for the signal to be zero
					Timer3us(90);
					while(test_logic_pin!=0);

					while(test_logic_pin!=1); // Wait for the signal to be one
					Timer3us(90);
					while(test_logic_pin!=1);

					TR0=1; // Start the timer
					while(test_logic_pin!=0) // Wait for the signal to be zero
					{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
					}
					while(test_logic_pin!=1) // Wait for the signal to be one
					{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
					}
					TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
					period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;
		    
	return period;

}

float Get_ref_peak(float period){ 
		 int peak_period_us=period*1000/4;
		 int peak_period_ms=period/4; 
		 float peak_ref_voltage; 
		 			
					while(ref_logic_pin!=0); // Wait for the signal to be zero
					while(ref_logic_pin!=1); // Wait for the signal to be one
					{
					waitms(peak_period_ms);
					Timer3us(peak_period_us);
					peak_ref_voltage = Volts_at_Pin(QFP32_MUX_P1_5); //ref
				//	printf("refPeak mstime: %i\n", peak_period_ms); 
				//	printf("refPeak ustime: %i\n", peak_period_us); 
			
					}
	return peak_ref_voltage;
		 }
		 
float Get_test_peak(float period){ 
		 int peak_period_us=period*1000/4; 
		 int peak_period_ms=period/4; 
		 float peak_test_voltage; 
		 
					while(test_logic_pin!=0); // Wait for the signal to be zero
					while(test_logic_pin!=1); // Wait for the signal to be one
					{
					waitms(peak_period_ms);
					Timer3us(peak_period_us);
					peak_test_voltage = Volts_at_Pin(QFP32_MUX_P1_6); //ref
				
					}
	return peak_test_voltage;
		 }


/*
Calculates the phase difference by finding whichever signal goes positive first, starting timer0 when that signal goes positive, and stopping the timer when the second signal goes positive. 
The phase is calculated by: 

timed_diff*360/period

*/
int Get_Phase_diff (float period)
{
	int phase_diff=0;
	float timed_diff=0;
	int flag0=0;
	volatile int flag=0; 		//when flag=1, reference was set first. When flag=-1, test was set first 
	
			
			// Reset the counter
			TL0=0; 
			TH0=0;
			TF0=0;
			overflow_count=0;

					while(flag0==0){					//Wait until both pins are zero. 
						if((ref_logic_pin==0)&&(test_logic_pin==0)){
							flag0=1;
						}}
			

					while(flag==0){			// check if either signal goes positive, and when it does, set a specific flag
							if(ref_logic_pin==1)
									flag=1; 
							if(test_logic_pin==1)
									flag=-1; 
					}
			
					
					if (flag==1){
						TR0=1; // Start the timer
						while(test_logic_pin!=1) // Wait for the signal to be zero
						{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
						}
					}
					else if(flag==-1){
						TR0=1; // Start the timer
						while(ref_logic_pin!=1) // Wait for the signal to be zero
						{
						if(TF0==1) // Did the 16-bit timer overflow?
						{
							TF0=0;
							overflow_count++;
						}
						}
					}
					TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
					timed_diff=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;


					phase_diff=timed_diff*360/period;
		    
		    		    		
		    //our current circuit with cap .01 uF maps to a linera phase output between -113 and 73 deg. The cap value was found to effect this phase difference. 
			// This section intended to rectify this difference to 0 to 180
		    	if(flag==1){
		    	phase_diff=-phase_diff;

		    	}
		    
			//	printf("%i\n", phase_diff);
		    	return phase_diff; 

}


void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	TR0=0; // Stop Timer/Counter 0
}


float get_max(float *array, int array_size){

	int i; 
	float current=0; 
	float max=array[0]; 

	for(i=0; i<array_size; i++){
		
		current=array[i];

		if (current>max){
			max=current;
			}
			}
			
	return max;
}



/*A program to measure the frequency, peak voltage, and phase difference between two 
analog sinusoidal signals. 
Period values are stored in ms. 
Phase is in degrees. 
Voltage is in rms. 

Zero cross comparator: 
Ref: Pin 2_0
Test: Pin 1_7

Positive (greater than 0 only) Analog signals: 
Ref: Pin 1_5
Test: Pin 1_6


*/
void main (void) 
{
	float phase_diff=0.0;
	float Vrms_ref=0.0;
	float Vrms_test=0;

	int count=0;
	int length=0;

	float Period_ref=0;
	float Period_test=0;
	int phase_diff_int=0;
	char* phase_string=NULL;
	int neg_flag=0;
	int Vrms_test_int=0;
	int Vrms_ref_int=0;
	

	//long int overflow_count;
	//int count; 
	//float period_array[sample_size]={0};


	TIMER0_Init();
	// Configure the LCD
	LCD_4BIT();

	waitms(500); // Give PuTTY a chance to start.
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	
	printf ("ADC test program\n"
	        "File: %s\n"
	        "Compiled: %s, %s\n\n",
	        __FILE__, __DATE__, __TIME__);
	
	InitPinADC(1, 5); // Configure P2.2 as analog input
	InitPinADC(1, 6); // Configure P2.3 as analog input
    InitADC();
    
 
	 //forever loop 
	 while (1)
    {
    	/*//get 5 period measurements
    	 for(i=0; i<sample_size; i++){
	    	 p_ref[i]= Get_Period_ref(); 
	    	 p_test[i]= Get_Period_test();
	    	// printf("get_period_test: %lf\n", p_test[i]);
	    	};*/
    		//takes max value in those 5 measurements
    	  Period_ref = Get_Period_ref(); //get_max(p_ref, sample_size);
    	  Period_test =Get_Period_test();// get_max(p_test, sample_size);


		 
		// if(Period_test-Period_ref<=1||Period_ref-Period_test<=1){ //proceed with analysis, as the signals are likely the same frequency 
		 
		 Vrms_ref= Get_ref_peak(Period_ref)/1.41421356; //wait 1/4 period and sample voltage, divide peak/sqrt(2)
		 Vrms_test= Get_test_peak(Period_test)/1.41421356;
		 

		 phase_diff_int= Get_Phase_diff (16.6666666666);//(Period_ref)+Period_test)/2);
		 
		
		
			// Read 14-bit value from the pins configured as analog inputs
			//v[0] = Volts_at_Pin(QFP32_MUX_P1_5); //ref
			//v[1] = Volts_at_Pin(QFP32_MUX_P1_6); //test
			printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
			printf ("V@P1.5=%7.5fV, V@P1.6=%7.5fV, Period_ref=%lf, Period_test=%lf, phase diff=%i \r", Vrms_ref, Vrms_test, Period_ref, Period_test, phase_diff_int);	
			Vrms_ref_int=Vrms_ref*1000;
			Vrms_test_int=Vrms_test*1000;
			
				printf("%lf\r\n %lf\r\n %i\r\n", Get_ref_peak(Period_ref), Get_test_peak(Period_test), phase_diff_int);
			
			 count=0;
			 neg_flag=0;
			 if (phase_diff_int<0){
			 	neg_flag=1;
		 		phase_diff_int=-phase_diff_int;
		 	
		 	}
		 	//if (phase_diff_int==0) neg_flag=-1;
			 
		 while(phase_diff_int)
				{
					phase_string[count] = 48+phase_diff_int%10;
					phase_string[count+3]=' ';
					
					phase_diff_int /= 10;
					count++;
					
					if(neg_flag==1&&phase_diff_int==0){
						phase_string[count]='-';
						
					
					}
					//else phase_string[count]='\0';
				}
				
			count+=2;
			
		while(Vrms_test_int)
			{
				phase_string[count]= 48+Vrms_test_int%10;
				phase_string[count+3]=' ';
				Vrms_test_int/=10;
			
				count++;
				}
		
			count+=1;
		
		while(Vrms_ref_int){
				phase_string[count]=48+Vrms_ref_int%10;
				phase_string[count+3]=' ';
				Vrms_ref_int/=10;
				count++;
				
				}
			phase_string[count]='\0';	
				
		
		
					//01234567890123456
			LCDprint("Vr   Vt   Phase ", 1,1);
			LCDprint_inv(phase_string, 2, 1);
			waitms(500);
			
			//clear array every time;
			for(count=0;count<15;count++){
			phase_string[count]=' ';
			}
			phase_string[count+1]='\0';
		
		//
		
	//	}
		//Needs to print to SPI, Magnitude_test, Magnitude_ref, Phase_difference

	// Display something in the LCD
	//		  1234567890123456


    }
 }

    
	









