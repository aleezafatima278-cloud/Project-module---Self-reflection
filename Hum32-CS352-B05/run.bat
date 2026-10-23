@echo off
setlocal
pushd "%~dp0"
if errorlevel 1 goto folder_error
where javac >nul 2>&1
if errorlevel 1 goto fail
where java >nul 2>&1
if errorlevel 1 goto fail
if exist "out\pilot\b05" rmdir /s /q "out\pilot\b05"
if exist "out\pilot\b05" goto fail
if not exist "out" mkdir "out"
if errorlevel 1 goto fail
javac --release 17 -encoding UTF-8 -cp "out" -d "out" "@sources.txt"
if errorlevel 1 goto fail
java -cp "out" pilot.b05.ReflectionDriver
set "exitCode=%errorlevel%"
popd
pause
exit /b %exitCode%
:fail
echo Build failed. ReflectionDriver was not started.
echo Check JDK setup, sources.txt and compiler messages.
popd
pause
exit /b 1
:folder_error
echo Cannot open the project folder.
pause
exit /b 1