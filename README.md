server-boilerplate
=====================
A personal boilerplate for setting up new Ubuntu/Debian servers for core programming use.

# Installation Steps

Step 1 - Install Core Essentials  
--------------------
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install build-essential cmake curl git vsftpd p7zip-full

Step 2 - Install Python Prerequisites
---------------------------------------
Install fail2ban as well while we're at it for security:  

    sudo apt-get -y install python-pip python3-pip python-dev python3-dev python-virtualenv fail2ban

Install [pyenv](https://github.com/pyenv/pyenv) for managing Python versions for system and application level.

Install useful Python packages.

	pip install --upgrade awscli

Configure Amazon AWS CLI:

	root@data-staging:~# aws configure
	AWS Access Key ID [None]: 

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

Set default node version in your shell:  

	root@dev:~# nvm alias default stable
	default -> stable (-> v0.12.1)

Check node version:  

	root@dev:~# node -v
	v0.12.0

All set to work with Node.js, `npm` is installed by default with an `nvm` installation.

Step 5 - Install Ruby
--------------------
Install Ruby Version Manager ([rvm](https://rvm.io/)):  

	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable

List all known *Rubies* (versions and compilers of Ruby):  

	rvm list known

Install a version of Ruby:

	root@dev:~# rvm install 2.2.0
	Searching for binary rubies, this might take some time.
	No binary rubies available for: ubuntu/14.04/i386/ruby-2.2.0.
	Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
	Checking requirements for ubuntu.
	Requirements installation successful.
	Installing Ruby from source to: /usr/local/rvm/rubies/ruby-2.2.0, this may take a while depending on your cpu(s)...
	ruby-2.2.0 - #downloading ruby-2.2.0, this may take a while depending on your connection...
	ruby-2.2.0 - #extracting ruby-2.2.0 to /usr/local/rvm/src/ruby-2.2.0....
	ruby-2.2.0 - #applying patch /usr/local/rvm/patches/ruby/2.2.0/fix_installing_bundled_gems.patch.
	ruby-2.2.0 - #configuring.........................................................
	ruby-2.2.0 - #post-configuration..
	ruby-2.2.0 - #compiling...............................................................................
	ruby-2.2.0 - #installing............................
	ruby-2.2.0 - #making binaries executable..
	ruby-2.2.0 - #downloading rubygems-2.4.6
	ruby-2.2.0 - #extracting rubygems-2.4.6.....
	ruby-2.2.0 - #removing old rubygems.........
	ruby-2.2.0 - #installing rubygems-2.4.6.....................
	ruby-2.2.0 - #gemset created /usr/local/rvm/gems/ruby-2.2.0@global
	ruby-2.2.0 - #importing gemset /usr/local/rvm/gemsets/global.gems...........................................................
	ruby-2.2.0 - #generating global wrappers........
	ruby-2.2.0 - #gemset created /usr/local/rvm/gems/ruby-2.2.0
	ruby-2.2.0 - #importing gemsetfile /usr/local/rvm/gemsets/default.gems evaluated to empty gem list
	ruby-2.2.0 - #generating default wrappers........
	ruby-2.2.0 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
	Install of ruby-2.2.0 - #complete 
	Ruby was built without documentation, to build it run: rvm docs generate-ri
	Making gemset ruby-2.2.0 pristine............................................................
	Making gemset ruby-2.2.0@global pristine..............................................................
	root@dev:~#

Do a Ruby version check:  

	root@dev:~$ ruby -v
	ruby 2.2.0p0 (2014-12-25 revision 49005) [i686-linux]

NOTE: Ruby installation takes a couple minutes. It is not as quick as Golang and Node.js so be patient.

To upgrade RVM itself do:

	rvm get stable
	rvm cleanup all

Step 6 - Install [Redis](http://redis.io/)
--------------------
``` sh
wget http://download.redis.io/releases/redis-stable.tar.gz
```
