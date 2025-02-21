@echo off

set "hasFParam=false"

:parseArgs
if "%~1"=="" goto endParse
if "%~1"=="-f" (
    set "hasFParam=true"
)
shift
goto parseArgs

:endParse

set OSGEO4W_FORCE_BUILD=0
set OSGEO4W_SKIP_TESTS=1
set OSGEO4W_BUILD_RDEPS=0
set OSGEO4W_SKIP_MASTER_REPO=1
set OSGEO4W_CONTINUE_BUILD=1
set OSGEO4W_BUILD_MODE=
set OSGEO4W_SKIP_UPLOAD=1
set OSGEO4W_SKIP_CLEAN=1
set O4W_REPO=jef-n/osgeo4w
set WINDOWS_KITS_ROOT=d/Windows Kits
set MSVS_ROOT=d:/Program Files
set CI=1

REM mklink /d "c:/Program Files (x86)/Windows Kits/10" "D:/Windows Kits/10" 

if "%hasFParam%"=="true" (
    echo "download bootstrap"
    curl --ssl-no-revoke -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/%O4W_REPO%/master/bootstrap.cmd>bootstrap.cmd
    curl --ssl-no-revoke -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/%O4W_REPO%/master/bootstrap.sh>bootstrap.sh
)

echo "build"
call bootstrap.cmd qgis-dev