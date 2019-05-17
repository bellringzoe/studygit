@ECHO OFF
setlocal EnableDelayedExpansion

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges ) 

:getPrivileges
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"

::Add quotes to the batch path, if needed
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
    set "batchPath=""%batchPath%"""
:PathQuotesDone

::Add quotes to the arguments, if needed.
:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
    :AddArg
    set "arg=%1"
    set arg=%arg:"=%
    IF '%1'=='!arg!' ( GOTO NoQuotes )
        set "batchArgs=%batchArgs% "%1""
        GOTO QuotesDone
        :NoQuotes
        set "batchArgs=%batchArgs% %1"
    :QuotesDone
    shift
    GOTO ArgLoop
:EndArgLoop

::Create and run the vb script to elevate the batch file
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs" 
exit /B

:START
::Remove the elevation tag and set the correct working directory
IF '%1'=='ELEV' ( shift /1 )
cd /d %~dp0

::Do your adminy thing here...
setup-x86.exe ^
--root %CD%/../../cygwin ^
-s https://mirrors.163.com/cygwin/ ^
-L -l %CD%/../../maintain/install ^
-q ^
--no-shortcuts ^
--disable-buggy-antivirus ^
--packages ^
_autorebase,^
alternatives,^
autossh,^
base-cygwin,^
base-files,^
bash,^
bash-completion,^
binutils,^
bzip2,^
ca-certificates,^
coreutils,^
cron,^
crypt,^
crypto-policies,^
csih,^
ctags,^
cygrunsrv,^
cygutils,^
cygwin,^
dash,^
dejavu-fonts,^
diffutils,^
editrights,^
expect,^
file,^
findutils,^
gawk,^
gdb,^
getent,^
git,^
git-svn,^
grep,^
groff,^
gzip,^
hostname,^
info,^
ipc-utils,^
jq,^
less,^
libX11_6,^
libXau6,^
libXdmcp6,^
libXext6,^
libXft2,^
libXrender1,^
libXss1,^
libapr1,^
libaprutil1,^
libargp,^
libattr1,^
libblkid1,^
libbz2_1,^
libcom_err2,^
libcrypt0,^
libcrypt2,^
libcurl4,^
libdb5.3,^
libedit0,^
libexpat1,^
libfdisk1,^
libffi6,^
libfontconfig-common,^
libfontconfig1,^
libfreetype6,^
libgc1,^
libgcc1,^
libgdbm4,^
libgmp10,^
libgnutls30,^
libgssapi_krb5_2,^
libguile2.0_22,^
libhogweed4,^
libiconv,^
libiconv2,^
libidn2_0,^
libintl8,^
libiodbc2,^
libjq1,^
libk5crypto3,^
libkrb5_3,^
libkrb5support0,^
libltdl7,^
liblz4_1,^
liblzma5,^
libmpfr6,^
libmysqlclient18,^
libncursesw10,^
libnettle6,^
libnghttp2_14,^
libonig4,^
libonig5,^
libopenldap2_4_2,^
libp11-kit0,^
libpcre1,^
libpipeline1,^
libpkgconf3,^
libpng16,^
libpopt-common,^
libpopt0,^
libpq5,^
libpsl5,^
libreadline7,^
libsasl2_3,^
libserf1_0,^
libsigsegv2,^
libsmartcols1,^
libsodium18,^
libsqlite3_0,^
libssh-common,^
libssh2_1,^
libssh4,^
libssl1.0,^
libssl1.1,^
libstdc++6,^
libtasn1_6,^
libunistring2,^
libuuid-devel,^
libuuid1,^
libwrap0,^
libxcb1,^
login,^
man-db,^
mariadb-common,^
mintty,^
mysql-common,^
nc,^
ncurses,^
openssh,^
openssl,^
p11-kit,^
p11-kit-trust,^
p7zip,^
perl,^
perl-Error,^
perl-Scalar-List-Utils,^
perl-Stow,^
perl-TermReadKey,^
perl-YAML,^
perl_autorebase,^
perl_base,^
pkg-config,^
pkgconf,^
publicsuffix-list-dafsa,^
python-pip-wheel,^
python-setuptools-wheel,^
python2,^
python27,^
python27-pip,^
python27-setuptools,^
python37,^
python37-pip,^
python37-setuptools,^
python37-wheel,^
rebase,^
rsync,^
run,^
sed,^
stow,^
subversion,^
subversion-perl,^
tar,^
tcl,^
tcl-tix,^
tcl-tk,^
terminfo,^
tree,^
tzcode,^
tzdata,^
util-linux,^
vim,^
vim-common,^
vim-doc,^
vim-minimal,^
wget,^
which,^
xxd,^
xz,^
zlib0

postinstall.bat
