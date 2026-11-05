@echo off
rem Shark Tank launcher (Windows). Works from any folder, including paths with spaces.
setlocal
set "TANK=%~dp0shark_tank.html"
set "URL=file:///%TANK:\=/%"
set "PROFILE=%TEMP%\SharkTankProfile"
for %%B in ("%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" "%LOCALAPPDATA%\BraveSoftware\Brave-Browser\Application\brave.exe") do (
  if exist %%B (
    start "" %%B "--app=%URL%" --window-size=1280,760 --autoplay-policy=no-user-gesture-required --ignore-gpu-blocklist --enable-gpu-rasterization "--user-data-dir=%PROFILE%"
    exit /b
  )
)
rem No Chromium browser found: open in the default browser.
start "" "%TANK%"
