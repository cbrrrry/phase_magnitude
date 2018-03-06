SHELL=cmd
CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=lab5EFM8.obj

PeriodEFM8.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
lab5EFM8.obj: mag_phase_EFM8.c
	$(CC) -c mag_phase_EFM8.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	EFM8_prog.exe -ft230 -r mag_phase_EFM8.hex
	cmd /c start c:\PUTTY\putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	cmd /c start c:\PUTTY\putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: mag_phase_EFM8.hex mag_phase_EFM8.Map
	@echo Nothing to see here!
	
explorer:
	cmd /c start explorer .
		