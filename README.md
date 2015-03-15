server-boilerplate
=====================
A personal boilerplate for setting up new Ubuntu/Debian servers for core programming use.

# Installation Steps

Step 1 - Install Core Essentials  
--------------------
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install build-essential curl git mercurial make binutils bison gcc 

Step 2 - Install Python Prerequisites
---------------------------------------
    sudo apt-get -y install python-pip python3-pip python-dev python3-dev virtualenv

Step 3 - Install Golang
--------------------
Install Go Version Manager ([gvm](https://github.com/moovweb/gvm)) prerequisites:  
	
	sudo apt-get -y install curl git mercurial make binutils bison gcc build-essential
	
Install [gvm](https://github.com/moovweb/gvm):  

	bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

A list of all available Golang versions at the time of writing this document.

    root@dev:~# gvm listall
    
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

    root@dev:~# gvm install go1.4.1
    Installing go1.4.1...
     * Compiling...
    root@dev:~# 

Let us tell `gvm` which version of `go` we wish to use:

    root@dev:~# gvm use go1.4.1 [--default]
    Now using version go1.4.1

`gvm` auto sets `$GOROOT` and `$GOPATH` environment variables however, it sets them into `.gvm/` directory. Let's set them to the normal `$HOME/go` dir.  

    export GOROOT=$HOME/go
    export PATH=$PATH:$GOROOT/bin
Add the above to `~/.bashrc` and then reopen the tty or do `source ~/.bashrc`.  

Do a final check to see if `go` is installed and running fine:

    root@dev:~# go version
    go version go1.4.1 linux/amd64

Step 4 - Install Node.js
--------------------
Install Node Version Manager ([nvm](https://github.com/creationix/nvm)):  
	
	curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash

Install the latest version of Node.js:  

	root@dev:~# nvm ls-remote
			v0.1.14
			v0.1.15
			v0.1.16
			...
			v0.11.15
			v0.11.16
			v0.12.0

	root@dev:~# nvm install 0.12.0
	######################################################################## 100.0%
	Now using node v0.12.0
	root@dev:~# nvm ls
	->      v0.12.0
			 system
	node -> stable (-> v0.12.0) (default)
	stable -> 0.12 (-> v0.12.0) (default)
	iojs -> iojs- (-> N/A) (default)

Optional/easiest way is to install the stable version:  

	root@dev:~# nvm install stable
	v0.12.0 is already installed.
	Now using node v0.12.0

Check node version:  

	root@dev:~# node -v
	v0.12.0

All set to work with Node.js, `npm` is installed by default with an `nvm` installation.

Step 4 - Install Ruby
--------------------
Install Ruby Version Manager ([rvm](https://rvm.io/)):  

	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable

List all known *Rubies* (versions and compilers of Ruby):  

	rvm list known

Install a version of Ruby:

	rvm install 2.2.0

Do a Ruby version check:  

	root@dev:~$ ruby -v
	ruby 2.2.0p0 (2014-12-25 revision 49005) [i686-linux]

