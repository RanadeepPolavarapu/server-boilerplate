server-boilerplate
=====================
A personal boilerplate for setting up new Ubuntu/Debian servers for core programming use.

# Installation Steps

Step 1 - Install Core Essentials:  
--------------------
    sudo apt-get -y update
    sudo apt-get -y update
    sudo apt-get -y install build-essential curl git mercurial make binutils bison gcc 

Step 2 - Install Python Prerequisites
---------------------------------------
    sudo apt-get -y install python-pip python3-pip python-dev python3-dev virtualenv

Step 2 - Install Golang
--------------------
A list of all available Golang versions at the time of writing this document.

    root@git:~# gvm listall
    
    gvm gos (available)
    
       go1
       go1.0.1
       go1.0.2
       go1.0.3
       go1.1
       go1.1.1
       go1.1.2
       go1.1rc2
       go1.1rc3
       ...
       go1.4
       go1.4.1
       go1.4beta1
       ...

Let's install the latest **stable** version:

    root@git:~# gvm install go1.4.1
    Installing go1.4.1...
     * Compiling...
    root@git:~# 

Let us tell `gvm` which version of `go` we wish to use:

    root@git:~# gvm use go1.4.1 [--default]
    Now using version go1.4.1

`gvm` auto sets `$GOROOT` and `$GOPATH` environment variables however, it sets them into `.gvm/` directory. Let's set them to the normal `$HOME/go` dir.  

    export GOROOT=$HOME/go
    export PATH=$PATH:$GOROOT/bin
Add the above to `~/.bashrc` and then reopen the tty or do `source ~/.bashrc`.  

Do a final check to see if `go` is installed and running fine:

    root@git:~# go version
    go version go1.4.1 linux/amd64