@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.c"
if not exist hex2mif.exe goto done
if exist mag_phase_EFM8.ihx hex2mif mag_phase_EFM8.ihx
if exist mag_phase_EFM8.hex hex2mif mag_phase_EFM8.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\carso\Documents\1. School\0. Spring 2018\Elec 292\lab5\mag_phase_EFM8.hex
