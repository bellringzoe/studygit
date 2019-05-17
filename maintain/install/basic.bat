setup-x86.exe ^
--root %CD%/../../ ^
-s https://mirrors.163.com/cygwin/ ^
-L -l %CD%\..\install ^
--no-shortcuts ^
--quiet-mode ^
--disable-buggy-antivirus ^
--packages ^
jq,^
vim,^
gdb ^

pause
