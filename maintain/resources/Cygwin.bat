@echo off
setlocal enableextensions
set ConEmuDir=%CD%/../conemu/
set TERM=
cd /d "%~dp0bin" && .\bash --login -i
