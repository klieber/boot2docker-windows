@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`boot2docker status`) DO (
  SET status=%%F
)

if "%status%" == "poweroff" (
  boot2docker start
)

set workdir=%cd:\=/%
set workdir=%workdir:C:=/c%

boot2docker ssh -t "[ ! -e \"%workdir%\" ] && sudo mkdir -p /c && sudo mount -t vboxsf c /c; [ -e \"%workdir%\" ] && cd \"%workdir%\" && docker %*"
