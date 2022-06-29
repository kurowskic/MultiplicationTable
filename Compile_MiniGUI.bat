if "%MG_ROOT%"=="" set MG_ROOT=%~d0\minigui

title mpt_hmg

call del.bat

copy mpt_ver2._ch mpt_ver.ch
copy mpt_hmg2._rc mpt_hmg.rc


call %MG_ROOT%\batch\compile.bat mpt_hmg /ro


call %MG_ROOT%\batch\compile.bat mpt_hmg                   /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                    /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeMultiplicationTable   /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeNavigation            /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DeleteMultiplicationTable /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                     /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndTheProgram             /nl %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat mpt_hmg /lo /b ctklib /b MakeMultiplicationTable /b MakeNavigation /b DeleteMultiplicationTable /b About /b EndTheProgram  /r mpt_hmg /nx %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat mpt_hmg                   /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                    /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeMultiplicationTable   /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MakeNavigation            /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DeleteMultiplicationTable /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                     /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndTheProgram             /do %1 %2 %3 %4 %5 %6 %7 %8 %9

IF NOT EXIST mpt_hmg.exe goto :END
IF NOT EXIST %~d0\upx-win32\upx.exe goto :END

IF EXIST %~d0\upx-win32\upx.exe %~d0\upx-win32\upx.exe -9 -q mpt_hmg.exe -o mpt.exe

IF EXIST mpt.exe DEL mpt_hmg.exe

:END

title OK
