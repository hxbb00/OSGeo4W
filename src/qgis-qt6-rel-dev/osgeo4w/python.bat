@echo off
call "%~dp0\o4w_env.bat"
call "%~dp0\qt6_env.bat"
@echo off
path %OSGEO4W_ROOT%\apps\@package@\bin;%PATH%
set QGIS_PREFIX_PATH=%OSGEO4W_ROOT:\=/%/apps/@package@
set GDAL_FILENAME_IS_UTF8=YES
rem Set VSI cache to be used as buffer, see #6448
set VSI_CACHE=TRUE
set VSI_CACHE_SIZE=1000000
set QT_PLUGIN_PATH=%OSGEO4W_ROOT%\apps\@package@\qtplugins;%OSGEO4W_ROOT%\apps\qt6\plugins
set PYTHONPATH=%OSGEO4W_ROOT%\apps\@package@\python;%PYTHONPATH%
python %*
