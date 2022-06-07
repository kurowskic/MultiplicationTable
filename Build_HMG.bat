SET PATH=%~d0\hmg.3.4.4\harbour\bin;%~d0\hmg.3.4.4\mingw\bin;%PATH%

title mpt_hmg

call del.bat

copy mpt_ver3._ch mpt_ver.ch
copy mpt_hmg3._rc mpt_hmg.rc

call %~d0\hmg.3.4.4\build.bat /n mpt_hmg.hbp mpt_hmg.hbc

IF NOT EXIST mpt_hmg.exe goto :END
IF NOT EXIST %~d0\upx-win32\upx.exe goto :END

IF EXIST %~d0\upx-win32\upx.exe %~d0\upx-win32\upx.exe -9 -q mpt_hmg.exe -o mpt.exe

IF EXIST mpt.exe DEL mpt_hmg.exe

:END

title OK
