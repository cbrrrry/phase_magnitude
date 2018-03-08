;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Thu Mar 08 12:31:45 2018
;--------------------------------------------------------
$name mag_phase_EFM8
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _get_max
	public _TIMER0_Init
	public _Get_Phase_diff
	public _Get_test_peak
	public _Get_ref_peak
	public _Get_Period_test
	public _Get_Period_ref
	public _InitADC
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _getsn
	public _LCDprint_inv
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _Timer3us
	public __c51_external_startup
	public _LCDprint_inv_PARM_3
	public _LCDprint_PARM_3
	public _get_max_PARM_2
	public _getsn_PARM_2
	public _LCDprint_inv_PARM_2
	public _LCDprint_PARM_2
	public _overflow_count
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_overflow_count:
	ds 4
_LCDprint_PARM_2:
	ds 1
_LCDprint_inv_PARM_2:
	ds 1
_LCDprint_inv_length_1_43:
	ds 2
_getsn_PARM_2:
	ds 2
_getsn_buff_1_44:
	ds 3
_getsn_sloc0_1_0:
	ds 2
_Get_Phase_diff_period_1_76:
	ds 4
_Get_Phase_diff_flag_1_77:
	ds 2
_get_max_PARM_2:
	ds 2
_get_max_array_1_89:
	ds 3
_get_max_max_1_90:
	ds 4
_main_Vrms_ref_1_94:
	ds 4
_main_Vrms_test_1_94:
	ds 4
_main_Period_ref_1_94:
	ds 4
_main_Period_test_1_94:
	ds 4
_main_phase_diff_int_1_94:
	ds 2
_main_phase_string_1_94:
	ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
_LCDprint_inv_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:36: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:39: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:40: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:41: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:43: VDM0CN |= 0x80;
	orl	_VDM0CN,#0x80
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:44: RSTSRC = 0x02;
	mov	_RSTSRC,#0x02
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:51: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:52: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:53: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:74: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:75: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:76: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:77: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:78: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:79: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:84: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:85: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:86: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:87: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:93: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:94: CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	mov	_CKCON0,_CKCON0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:95: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:96: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:97: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:98: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:99: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:100: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:102: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:108: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:113: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:115: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:116: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:118: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:119: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:121: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:122: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:119: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:124: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:127: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:131: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:132: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L004001?:
	cjne	r6,#0x04,L004018?
L004018?:
	jnc	L004007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L004001?
L004007?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:131: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L004005?
	inc	r5
	sjmp	L004005?
L004009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:135: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:137: LCD_E=1;
	setb	_P2_5
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:138: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:139: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:142: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:145: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:146: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_1,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:147: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_2,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:148: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_3,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:149: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_4,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:150: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:151: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:152: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:153: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:154: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:155: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:156: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:157: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:160: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:162: LCD_RS=1;
	setb	_P2_6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:163: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:164: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:167: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:169: LCD_RS=0;
	clr	_P2_6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:170: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:171: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:174: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:176: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:178: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:180: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:181: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:182: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:185: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:186: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:187: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:188: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:191: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:195: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L010013?
	mov	r5,#0xC0
	sjmp	L010014?
L010013?:
	mov	r5,#0x80
L010014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:196: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:197: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L010003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L010006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L010003?
	inc	r6
	sjmp	L010003?
L010006?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:198: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L010011?
	mov	ar2,r5
	mov	ar3,r6
L010007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L010011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L010007?
	inc	r3
	sjmp	L010007?
L010011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint_inv'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_inv_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;length                    Allocated with name '_LCDprint_inv_length_1_43'
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:201: void LCDprint_inv(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint_inv
;	-----------------------------------------
_LCDprint_inv:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:206: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_inv_PARM_2,L011017?
	mov	r5,#0xC0
	sjmp	L011018?
L011017?:
	mov	r5,#0x80
L011018?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:207: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:208: for(j=0; string[j]!=0; j++)	length++;
	clr	a
	mov	_LCDprint_inv_length_1_43,a
	mov	(_LCDprint_inv_length_1_43 + 1),a
	mov	r7,a
	mov	r0,a
L011003?:
	mov	a,r7
	add	a,r2
	mov	r1,a
	mov	a,r0
	addc	a,r3
	mov	r5,a
	mov	ar6,r4
	mov	dpl,r1
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r1,a
	jz	L011006?
	inc	_LCDprint_inv_length_1_43
	clr	a
	cjne	a,_LCDprint_inv_length_1_43,L011032?
	inc	(_LCDprint_inv_length_1_43 + 1)
L011032?:
	inc	r7
	cjne	r7,#0x00,L011003?
	inc	r0
	sjmp	L011003?
L011006?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:209: for(j=length-1; j>=0; j--) WriteData(string[j]);// Write the message
	mov	a,_LCDprint_inv_length_1_43
	add	a,#0xff
	mov	r5,a
	mov	a,(_LCDprint_inv_length_1_43 + 1)
	addc	a,#0xff
	mov	r6,a
L011007?:
	mov	a,r6
	jb	acc.7,L011010?
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	dpl,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	dec	r5
	cjne	r5,#0xff,L011035?
	dec	r6
L011035?:
	sjmp	L011007?
L011010?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:210: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_inv_PARM_3,L011015?
	mov	ar2,r5
	mov	ar3,r6
L011011?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L011015?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L011011?
	inc	r3
	sjmp	L011011?
L011015?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_44'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:214: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_44,dpl
	mov	(_getsn_buff_1_44 + 1),dph
	mov	(_getsn_buff_1_44 + 2),b
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:219: for(j=0; j<(len-1); j++)
	clr	a
	mov	_getsn_sloc0_1_0,a
	mov	(_getsn_sloc0_1_0 + 1),a
	mov	a,_getsn_PARM_2
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_2 + 1)
	addc	a,#0xff
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
L012005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L012008?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:221: c=getchar();
	push	ar2
	push	ar7
	push	ar0
	push	ar1
	lcall	_getchar
	mov	r3,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:222: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L012015?
	sjmp	L012001?
L012015?:
	cjne	r3,#0x0D,L012002?
L012001?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:224: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_44
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_44 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_44 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:225: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L012002?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:229: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_44
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_44 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_44 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:219: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L012018?
	inc	r2
L012018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L012005?
L012008?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:232: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_44
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_44 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_44 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:233: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pin_num                   Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:236: void InitPinADC (unsigned char portno, unsigned char pin_num)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:240: mask=1<<pin_num;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L013013?
L013011?:
	add	a,acc
L013013?:
	djnz	b,L013011?
	mov	r3,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:242: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:243: switch (portno)
	cjne	r2,#0x00,L013014?
	sjmp	L013001?
L013014?:
	cjne	r2,#0x01,L013015?
	sjmp	L013002?
L013015?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:245: case 0:
	cjne	r2,#0x02,L013005?
	sjmp	L013003?
L013001?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:246: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:247: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:248: break;
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:249: case 1:
	sjmp	L013005?
L013002?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:250: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:251: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:252: break;
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:253: case 2:
	sjmp	L013005?
L013003?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:254: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:255: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:259: }
L013005?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:260: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:263: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:266: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:267: while (ADBUSY); // Wait for dummy conversion to finish
L014001?:
	jb	_ADBUSY,L014001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:268: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:269: while (ADBUSY); // Wait for conversion to complete
L014004?:
	jb	_ADBUSY,L014004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:270: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:273: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:275: return ((ADC_at_Pin(pin)*VDD)/16383.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6C8B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:278: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:280: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:281: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:282: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:283: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:284: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:285: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:286: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:287: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Period_ref'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:290: float Get_Period_ref (void)
;	-----------------------------------------
;	 function Get_Period_ref
;	-----------------------------------------
_Get_Period_ref:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:295: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:296: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:297: TF0=0;
	clr	_TF0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:298: overflow_count=0;
	clr	a
	mov	_overflow_count,a
	mov	(_overflow_count + 1),a
	mov	(_overflow_count + 2),a
	mov	(_overflow_count + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:299: while(ref_logic_pin!=0); // Wait for the signal to be zero
L017001?:
	jb	_P2_0,L017001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:300: while(ref_logic_pin!=1); // Wait for the signal to be one		
L017004?:
	jnb	_P2_0,L017004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:301: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:302: while(ref_logic_pin!=0) // Wait for the signal to be zero
L017009?:
	jnb	_P2_0,L017014?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:304: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:306: TF0=0;
	jbc	_TF0,L017031?
	sjmp	L017009?
L017031?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:307: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L017009?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L017009?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L017009?
	inc	(_overflow_count + 3)
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:310: while(ref_logic_pin!=1) // Wait for the signal to be one
	sjmp	L017009?
L017014?:
	jb	_P2_0,L017016?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:312: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:314: TF0=0;
	jbc	_TF0,L017033?
	sjmp	L017014?
L017033?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:315: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L017014?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L017014?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L017014?
	inc	(_overflow_count + 3)
	sjmp	L017014?
L017016?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:318: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:319: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;
	mov	dpl,_overflow_count
	mov	dph,(_overflow_count + 1)
	mov	b,(_overflow_count + 2)
	mov	a,(_overflow_count + 3)
	lcall	___slong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xC33E
	mov	b,#0x2E
	mov	a,#0x39
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:323: return period;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Period_test'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:327: float Get_Period_test (void)
;	-----------------------------------------
;	 function Get_Period_test
;	-----------------------------------------
_Get_Period_test:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:333: TL0=0; 
	mov	_TL0,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:334: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:335: TF0=0;
	clr	_TF0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:336: overflow_count=0;
	clr	a
	mov	_overflow_count,a
	mov	(_overflow_count + 1),a
	mov	(_overflow_count + 2),a
	mov	(_overflow_count + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:337: while(test_logic_pin!=0); // Wait for the signal to be zero
L018001?:
	jb	_P1_7,L018001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:338: Timer3us(90);
	mov	dpl,#0x5A
	lcall	_Timer3us
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:339: while(test_logic_pin!=0);
L018004?:
	jb	_P1_7,L018004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:341: while(test_logic_pin!=1); // Wait for the signal to be one
L018007?:
	jnb	_P1_7,L018007?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:342: Timer3us(90);
	mov	dpl,#0x5A
	lcall	_Timer3us
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:343: while(test_logic_pin!=1);
L018010?:
	jnb	_P1_7,L018010?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:345: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:346: while(test_logic_pin!=0) // Wait for the signal to be zero
L018015?:
	jnb	_P1_7,L018020?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:348: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:350: TF0=0;
	jbc	_TF0,L018043?
	sjmp	L018015?
L018043?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:351: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L018015?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L018015?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L018015?
	inc	(_overflow_count + 3)
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:354: while(test_logic_pin!=1) // Wait for the signal to be one
	sjmp	L018015?
L018020?:
	jb	_P1_7,L018022?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:356: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:358: TF0=0;
	jbc	_TF0,L018045?
	sjmp	L018020?
L018045?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:359: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L018020?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L018020?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L018020?
	inc	(_overflow_count + 3)
	sjmp	L018020?
L018022?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:362: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:363: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;
	mov	dpl,_overflow_count
	mov	dph,(_overflow_count + 1)
	mov	b,(_overflow_count + 2)
	mov	a,(_overflow_count + 3)
	lcall	___slong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xC33E
	mov	b,#0x2E
	mov	a,#0x39
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:365: return period;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_ref_peak'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 r4 r5 
;peak_period_us            Allocated to registers r6 r7 
;peak_period_ms            Allocated to registers r2 r3 
;peak_ref_voltage          Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:369: float Get_ref_peak(float period){ 
;	-----------------------------------------
;	 function Get_ref_peak
;	-----------------------------------------
_Get_ref_peak:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:370: int peak_period_us=period*1000/4;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fs2sint
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:371: int peak_period_ms=period/4; 
	push	ar6
	push	ar7
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	r2,dpl
	mov	r3,dph
	pop	ar7
	pop	ar6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:374: while(ref_logic_pin!=0); // Wait for the signal to be zero
L019001?:
	jb	_P2_0,L019001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:375: while(ref_logic_pin!=1); // Wait for the signal to be one
L019004?:
	jnb	_P2_0,L019004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:377: waitms(peak_period_ms);
	mov	dpl,r2
	mov	dph,r3
	push	ar6
	push	ar7
	lcall	_waitms
	pop	ar7
	pop	ar6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:378: Timer3us(peak_period_us);
	mov	dpl,r6
	lcall	_Timer3us
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:379: peak_ref_voltage = Volts_at_Pin(QFP32_MUX_P1_5); //ref
	mov	dpl,#0x0B
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:384: return peak_ref_voltage;
	ljmp	_Volts_at_Pin
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_test_peak'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 r4 r5 
;peak_period_us            Allocated to registers r6 r7 
;peak_period_ms            Allocated to registers r2 r3 
;peak_test_voltage         Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:387: float Get_test_peak(float period){ 
;	-----------------------------------------
;	 function Get_test_peak
;	-----------------------------------------
_Get_test_peak:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:388: int peak_period_us=period*1000/4; 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fs2sint
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:389: int peak_period_ms=period/4; 
	push	ar6
	push	ar7
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2sint
	mov	r2,dpl
	mov	r3,dph
	pop	ar7
	pop	ar6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:392: while(test_logic_pin!=0); // Wait for the signal to be zero
L020001?:
	jb	_P1_7,L020001?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:393: while(test_logic_pin!=1); // Wait for the signal to be one
L020004?:
	jnb	_P1_7,L020004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:395: waitms(peak_period_ms);
	mov	dpl,r2
	mov	dph,r3
	push	ar6
	push	ar7
	lcall	_waitms
	pop	ar7
	pop	ar6
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:396: Timer3us(peak_period_us);
	mov	dpl,r6
	lcall	_Timer3us
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:397: peak_test_voltage = Volts_at_Pin(QFP32_MUX_P1_6); //ref
	mov	dpl,#0x0C
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:400: return peak_test_voltage;
	ljmp	_Volts_at_Pin
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_Phase_diff'
;------------------------------------------------------------
;period                    Allocated with name '_Get_Phase_diff_period_1_76'
;phase_diff                Allocated to registers 
;timed_diff                Allocated to registers r2 r3 r4 r5 
;flag0                     Allocated to registers r6 r7 
;flag                      Allocated with name '_Get_Phase_diff_flag_1_77'
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:411: int Get_Phase_diff (float period)
;	-----------------------------------------
;	 function Get_Phase_diff
;	-----------------------------------------
_Get_Phase_diff:
	mov	_Get_Phase_diff_period_1_76,dpl
	mov	(_Get_Phase_diff_period_1_76 + 1),dph
	mov	(_Get_Phase_diff_period_1_76 + 2),b
	mov	(_Get_Phase_diff_period_1_76 + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:415: int flag0=0;
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:416: volatile int flag=0; 		//when flag=1, reference was set first. When flag=-1, test was set first 
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:420: TL0=0; 
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:421: TH0=0;
	clr	a
	mov	r6,a
	mov	r7,a
	mov	_Get_Phase_diff_flag_1_77,a
	mov	(_Get_Phase_diff_flag_1_77 + 1),a
	mov	_TL0,a
	mov	_TH0,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:422: TF0=0;
	clr	_TF0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:423: overflow_count=0;
	clr	a
	mov	_overflow_count,a
	mov	(_overflow_count + 1),a
	mov	(_overflow_count + 2),a
	mov	(_overflow_count + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:425: while(flag0==0){					//Wait until both pins are zero. 
L021004?:
	mov	a,r6
	orl	a,r7
	jnz	L021011?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:426: if((ref_logic_pin==0)&&(test_logic_pin==0)){
	jb	_P2_0,L021004?
	jb	_P1_7,L021004?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:427: flag0=1;
	mov	r6,#0x01
	mov	r7,#0x00
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:431: while(flag==0){			// check if either signal goes positive, and when it does, set a specific flag
	sjmp	L021004?
L021011?:
	mov	a,_Get_Phase_diff_flag_1_77
	orl	a,(_Get_Phase_diff_flag_1_77 + 1)
	jnz	L021013?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:432: if(ref_logic_pin==1)
	jnb	_P2_0,L021008?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:433: flag=1; 
	mov	_Get_Phase_diff_flag_1_77,#0x01
	clr	a
	mov	(_Get_Phase_diff_flag_1_77 + 1),a
L021008?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:434: if(test_logic_pin==1)
	jnb	_P1_7,L021011?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:435: flag=-1; 
	mov	_Get_Phase_diff_flag_1_77,#0xFF
	mov	(_Get_Phase_diff_flag_1_77 + 1),#0xFF
	sjmp	L021011?
L021013?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:439: if (flag==1){
	mov	a,#0x01
	cjne	a,_Get_Phase_diff_flag_1_77,L021053?
	clr	a
	cjne	a,(_Get_Phase_diff_flag_1_77 + 1),L021053?
	sjmp	L021054?
L021053?:
	sjmp	L021027?
L021054?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:440: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:441: while(test_logic_pin!=1) // Wait for the signal to be zero
L021016?:
	jb	_P1_7,L021028?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:443: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:445: TF0=0;
	jbc	_TF0,L021056?
	sjmp	L021016?
L021056?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:446: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L021016?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L021016?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L021016?
	inc	(_overflow_count + 3)
	sjmp	L021016?
L021027?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:450: else if(flag==-1){
	mov	a,#0xFF
	cjne	a,_Get_Phase_diff_flag_1_77,L021028?
	mov	a,#0xFF
	cjne	a,(_Get_Phase_diff_flag_1_77 + 1),L021028?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:451: TR0=1; // Start the timer
	setb	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:452: while(ref_logic_pin!=1) // Wait for the signal to be zero
L021021?:
	jb	_P2_0,L021028?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:454: if(TF0==1) // Did the 16-bit timer overflow?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:456: TF0=0;
	jbc	_TF0,L021060?
	sjmp	L021021?
L021060?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:457: overflow_count++;
	inc	_overflow_count
	clr	a
	cjne	a,_overflow_count,L021021?
	inc	(_overflow_count + 1)
	cjne	a,(_overflow_count + 1),L021021?
	inc	(_overflow_count + 2)
	cjne	a,(_overflow_count + 2),L021021?
	inc	(_overflow_count + 3)
	sjmp	L021021?
L021028?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:461: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:462: timed_diff=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000;
	mov	dpl,_overflow_count
	mov	dph,(_overflow_count + 1)
	mov	b,(_overflow_count + 2)
	mov	a,(_overflow_count + 3)
	lcall	___slong2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xC33E
	mov	b,#0x2E
	mov	a,#0x39
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:465: phase_diff=timed_diff*360/period;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_Get_Phase_diff_period_1_76
	push	(_Get_Phase_diff_period_1_76 + 1)
	push	(_Get_Phase_diff_period_1_76 + 2)
	push	(_Get_Phase_diff_period_1_76 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:478: return phase_diff; 
	ljmp	___fs2sint
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:483: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:485: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:486: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:487: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_max'
;------------------------------------------------------------
;array_size                Allocated with name '_get_max_PARM_2'
;array                     Allocated with name '_get_max_array_1_89'
;i                         Allocated to registers r1 r2 
;current                   Allocated to registers r3 r4 r5 r6 
;max                       Allocated with name '_get_max_max_1_90'
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:491: float get_max(float *array, int array_size){
;	-----------------------------------------
;	 function get_max
;	-----------------------------------------
_get_max:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:495: float max=array[0]; 
	mov	_get_max_array_1_89,dpl
	mov	(_get_max_array_1_89 + 1),dph
	mov	(_get_max_array_1_89 + 2),b
	lcall	__gptrget
	mov	_get_max_max_1_90,a
	inc	dptr
	lcall	__gptrget
	mov	(_get_max_max_1_90 + 1),a
	inc	dptr
	lcall	__gptrget
	mov	(_get_max_max_1_90 + 2),a
	inc	dptr
	lcall	__gptrget
	mov	(_get_max_max_1_90 + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:497: for(i=0; i<array_size; i++){
	mov	r1,#0x00
	mov	r2,#0x00
L023003?:
	clr	c
	mov	a,r1
	subb	a,_get_max_PARM_2
	mov	a,r2
	xrl	a,#0x80
	mov	b,(_get_max_PARM_2 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L023006?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:499: current=array[i];
	mov	ar3,r1
	mov	a,r2
	xch	a,r3
	add	a,acc
	xch	a,r3
	rlc	a
	xch	a,r3
	add	a,acc
	xch	a,r3
	rlc	a
	mov	r4,a
	mov	a,r3
	add	a,_get_max_array_1_89
	mov	r3,a
	mov	a,r4
	addc	a,(_get_max_array_1_89 + 1)
	mov	r4,a
	mov	r5,(_get_max_array_1_89 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	lcall	__gptrget
	mov	r3,a
	inc	dptr
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:501: if (current>max){
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar1
	push	_get_max_max_1_90
	push	(_get_max_max_1_90 + 1)
	push	(_get_max_max_1_90 + 2)
	push	(_get_max_max_1_90 + 3)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r6
	lcall	___fsgt
	mov	r7,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r7
	jz	L023005?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:502: max=current;
	mov	_get_max_max_1_90,r3
	mov	(_get_max_max_1_90 + 1),r4
	mov	(_get_max_max_1_90 + 2),r5
	mov	(_get_max_max_1_90 + 3),r6
L023005?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:497: for(i=0; i<array_size; i++){
	inc	r1
	cjne	r1,#0x00,L023015?
	inc	r2
L023015?:
	ljmp	L023003?
L023006?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:506: return max;
	mov	dpl,_get_max_max_1_90
	mov	dph,(_get_max_max_1_90 + 1)
	mov	b,(_get_max_max_1_90 + 2)
	mov	a,(_get_max_max_1_90 + 3)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;phase_diff                Allocated to registers 
;Vrms_ref                  Allocated with name '_main_Vrms_ref_1_94'
;Vrms_test                 Allocated with name '_main_Vrms_test_1_94'
;count                     Allocated to registers r2 r3 
;length                    Allocated to registers 
;Period_ref                Allocated with name '_main_Period_ref_1_94'
;Period_test               Allocated with name '_main_Period_test_1_94'
;phase_diff_int            Allocated with name '_main_phase_diff_int_1_94'
;phase_string              Allocated with name '_main_phase_string_1_94'
;------------------------------------------------------------
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:527: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:539: char* phase_string=NULL;
	clr	a
	mov	_main_phase_string_1_94,a
	mov	(_main_phase_string_1_94 + 1),a
	mov	(_main_phase_string_1_94 + 2),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:549: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:551: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:553: waitms(500); // Give PuTTY a chance to start.
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:554: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:559: __FILE__, __DATE__, __TIME__);
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:558: "Compiled: %s, %s\n\n",
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:561: InitPinADC(1, 5); // Configure P2.2 as analog input
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:562: InitPinADC(1, 6); // Configure P2.3 as analog input
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:563: InitADC();
	lcall	_InitADC
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:567: while (1)
L024005?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:576: Period_ref = Get_Period_ref(); //get_max(p_ref, sample_size);
	lcall	_Get_Period_ref
	mov	_main_Period_ref_1_94,dpl
	mov	(_main_Period_ref_1_94 + 1),dph
	mov	(_main_Period_ref_1_94 + 2),b
	mov	(_main_Period_ref_1_94 + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:577: Period_test =Get_Period_test();// get_max(p_test, sample_size);
	lcall	_Get_Period_test
	mov	_main_Period_test_1_94,dpl
	mov	(_main_Period_test_1_94 + 1),dph
	mov	(_main_Period_test_1_94 + 2),b
	mov	(_main_Period_test_1_94 + 3),a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:583: Vrms_ref= Get_ref_peak(Period_ref)/1.41421356; //wait 1/4 period and sample voltage, divide peak/sqrt(2)
	mov	dpl,_main_Period_ref_1_94
	mov	dph,(_main_Period_ref_1_94 + 1)
	mov	b,(_main_Period_ref_1_94 + 2)
	mov	a,(_main_Period_ref_1_94 + 3)
	lcall	_Get_ref_peak
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r1
	lcall	___fsdiv
	mov	_main_Vrms_ref_1_94,dpl
	mov	(_main_Vrms_ref_1_94 + 1),dph
	mov	(_main_Vrms_ref_1_94 + 2),b
	mov	(_main_Vrms_ref_1_94 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:584: Vrms_test= Get_test_peak(Period_test)/1.41421356;
	mov	dpl,_main_Period_test_1_94
	mov	dph,(_main_Period_test_1_94 + 1)
	mov	b,(_main_Period_test_1_94 + 2)
	mov	a,(_main_Period_test_1_94 + 3)
	lcall	_Get_test_peak
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r1
	lcall	___fsdiv
	mov	_main_Vrms_test_1_94,dpl
	mov	(_main_Vrms_test_1_94 + 1),dph
	mov	(_main_Vrms_test_1_94 + 2),b
	mov	(_main_Vrms_test_1_94 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:587: phase_diff_int= Get_Phase_diff (16.666666);//(Period_ref)+Period_test)/2);
	mov	dptr,#0x5555
	mov	b,#0x85
	mov	a,#0x41
	lcall	_Get_Phase_diff
	mov	_main_phase_diff_int_1_94,dpl
	mov	(_main_phase_diff_int_1_94 + 1),dph
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:593: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:594: printf ("V@P1.5=%7.5fV, V@P1.6=%7.5fV, Period_ref=%lf, Period_test=%lf, phase diff=%i \r", Vrms_ref, Vrms_test, Period_ref, Period_test, phase_diff_int);	
	push	_main_phase_diff_int_1_94
	push	(_main_phase_diff_int_1_94 + 1)
	push	_main_Period_test_1_94
	push	(_main_Period_test_1_94 + 1)
	push	(_main_Period_test_1_94 + 2)
	push	(_main_Period_test_1_94 + 3)
	push	_main_Period_ref_1_94
	push	(_main_Period_ref_1_94 + 1)
	push	(_main_Period_ref_1_94 + 2)
	push	(_main_Period_ref_1_94 + 3)
	push	_main_Vrms_test_1_94
	push	(_main_Vrms_test_1_94 + 1)
	push	(_main_Vrms_test_1_94 + 2)
	push	(_main_Vrms_test_1_94 + 3)
	push	_main_Vrms_ref_1_94
	push	(_main_Vrms_ref_1_94 + 1)
	push	(_main_Vrms_ref_1_94 + 2)
	push	(_main_Vrms_ref_1_94 + 3)
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xeb
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:597: printf("%lf\r\n %lf\r\n %i\r\n", Get_ref_peak(Period_ref), Get_test_peak(Period_test), phase_diff_int);
	mov	dpl,_main_Period_test_1_94
	mov	dph,(_main_Period_test_1_94 + 1)
	mov	b,(_main_Period_test_1_94 + 2)
	mov	a,(_main_Period_test_1_94 + 3)
	lcall	_Get_test_peak
	mov	r4,dpl
	mov	r1,dph
	mov	r5,b
	mov	r6,a
	mov	dpl,_main_Period_ref_1_94
	mov	dph,(_main_Period_ref_1_94 + 1)
	mov	b,(_main_Period_ref_1_94 + 2)
	mov	a,(_main_Period_ref_1_94 + 3)
	push	ar4
	push	ar5
	push	ar6
	push	ar1
	lcall	_Get_ref_peak
	mov	r7,dpl
	mov	r0,dph
	mov	r2,b
	mov	r3,a
	pop	ar1
	pop	ar6
	pop	ar5
	pop	ar4
	push	_main_phase_diff_int_1_94
	push	(_main_phase_diff_int_1_94 + 1)
	push	ar4
	push	ar1
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar2
	push	ar3
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:600: while(phase_diff_int)
	mov	r2,#0x00
	mov	r3,#0x00
L024001?:
	mov	a,_main_phase_diff_int_1_94
	orl	a,(_main_phase_diff_int_1_94 + 1)
	jz	L024003?
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:602: phase_string[count] = 48+phase_diff_int%10;
	mov	a,r2
	add	a,_main_phase_string_1_94
	mov	r4,a
	mov	a,r3
	addc	a,(_main_phase_string_1_94 + 1)
	mov	r5,a
	mov	r6,(_main_phase_string_1_94 + 2)
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,_main_phase_diff_int_1_94
	mov	dph,(_main_phase_diff_int_1_94 + 1)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	__modsint
	mov	r7,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	mov	a,#0x30
	add	a,r7
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrput
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:603: phase_diff_int /= 10;
	mov	__divsint_PARM_2,#0x0A
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,_main_phase_diff_int_1_94
	mov	dph,(_main_phase_diff_int_1_94 + 1)
	lcall	__divsint
	mov	_main_phase_diff_int_1_94,dpl
	mov	(_main_phase_diff_int_1_94 + 1),dph
	pop	ar3
	pop	ar2
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:604: count++;
	inc	r2
	cjne	r2,#0x00,L024001?
	inc	r3
	sjmp	L024001?
L024003?:
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:610: LCDprint_inv(phase_string, 1, 1);
	mov	_LCDprint_inv_PARM_2,#0x01
	setb	_LCDprint_inv_PARM_3
	mov	dpl,_main_phase_string_1_94
	mov	dph,(_main_phase_string_1_94 + 1)
	mov	b,(_main_phase_string_1_94 + 2)
	lcall	_LCDprint_inv
;	C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c:611: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
	ljmp	L024005?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'ADC test program'
	db 0x0A
	db 'File: %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db 0x0A
	db 0x00
__str_2:
	db 'C:'
	db 0x5C
	db 'Users'
	db 0x5C
	db 'carso'
	db 0x5C
	db 'Documents'
	db 0x5C
	db '1. School'
	db 0x5C
	db '0. Spring 2018'
	db 0x5C
	db 'Elec 292'
	db 0x5C
	db 'l'
	db 'ab5'
	db 0x5C
	db 'mag_phase_EFM8.c'
	db 0x00
__str_3:
	db 'Mar  8 2018'
	db 0x00
__str_4:
	db '12:31:45'
	db 0x00
__str_5:
	db 'V@P1.5=%7.5fV, V@P1.6=%7.5fV, Period_ref=%lf, Period_test=%l'
	db 'f, phase diff=%i '
	db 0x0D
	db 0x00
__str_6:
	db '%lf'
	db 0x0D
	db 0x0A
	db ' %lf'
	db 0x0D
	db 0x0A
	db ' %i'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
