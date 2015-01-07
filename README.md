What is this?
-------------

This is a simple script that wraps around boot2docker to make docker feel more native on windows.

What does it do?
----------------

 1. Automatically starts boot2docker if it is not already running.
 2. Mounts your `C:\` drive on the VM at `/c` if it's not already mounted.
 3. Determines your current working directory on the Windows machine and changes to the equivalent directory on the VM.
 4. Runs your docker command.
 
Example
-------
If you have a simple `Dockerfile` like the following at `C:\example\Dockerfile`:
```dockerfile
FROM ubuntu
ENTRYPOINT ["echo"]
CMD ["hello world"]
```

With the wrapper script you can just open up a Windows command prompt and enter the following to build the image and then run it:
```batch
> cd C:\example
> docker build -t hello .
> docker run -ti --rm hello
```

No need to run `boot2docker start` or `boot2docker ssh`.  Just work with your local files as you would with docker on Linux.

Requirements
------------
Boot2Docker v1.3.0 or later

Quick Installation
------------------
Run these commands from a Windows command prompt:
```batch
> boot2docker stop
> VBoxManage.exe sharedfolder add boot2docker-vm --name c --hostpath C:\ --automount
> git clone https://github.com/klieber/boot2docker-windows.git
> cd boot2docker-windows
> copy docker* C:\Program Files\Boot2Docker for Windows
> docker run -ti --rm hello-world
```

Cygwin
------
Cygwin is also supported and the same installation steps should be taken to install it for both Cygwin and CMD.EXE.
