start cmd.exe /c
cd C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\i386\
start CmRcViewer.exe W80D99X3
timeout /t 300 /nobreak
taskkill /f /im CmRcViewer.exe
