@echo off
echo Czyszczenie bufora wydruku
net stop spooler
echo Trwa usuwanie dokumentow w kolejce drukowania
del /q /f /s "%systemroot%\system32\spool\PRINTERS\*.*"
net start spooler
echo Pomyslnie wykonano wszystkie czynnosci
pause
