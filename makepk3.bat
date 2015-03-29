@echo off
REM This script makes a ready-to-use *.pk3 file from the contents of the pk3 folder.

for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined dt set dt=%%x

SET "YY=%dt:~2,2%" & SET "YYYY=%dt:~0,4%" & SET "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & SET "Min=%dt:~10,2%" & SET "Sec=%dt:~12,2%"

SET "FULLSTAMP=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
SET "DATESTAMP=%YYYY%-%MM%-%DD%"

SET ARCHIVENAME=trib_dev
SET ZIPARCHIVENAME=trib_dev.zip
SET PK3ARCHIVENAME=trib_dev.pk3
SET PK3DIR=.\pk3\*

del %ZIPARCHIVENAME%
del %PK3ARCHIVENAME%
7za a %ZIPARCHIVENAME% %PK3DIR%
copy "%ZIPARCHIVENAME%" "%ARCHIVENAME%-%DATESTAMP%.pk3" >nul

pause