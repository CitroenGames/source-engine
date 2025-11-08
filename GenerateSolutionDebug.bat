@echo off
echo ========================================
echo Generating Release Visual Studio Solution
echo ========================================
echo.

echo Cleaning previous configuration...
if exist build\config.log del build\config.log

echo Configuring for Debug build...
python waf configure -T debug
if errorlevel 1 (
    echo.
    echo ERROR: Configuration failed!
    pause
    exit /b 1
)

echo.
echo Generating Visual Studio solution files...
python waf msvs
if errorlevel 1 (
    echo.
    echo ERROR: Solution generation failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Debug solution generated.
echo Check the build directory for .sln file
echo ========================================
pause