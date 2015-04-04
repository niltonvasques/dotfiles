#dotfiles

My personal repo to store dotfiles used by some programs, like vim, tmux e etc.

###Instalation
---------------------

For run ruby script is required install ruby interpreter.
#####First Method: Using RVM
> Wondering why you should use RVM? For a start, not only does RVM make installing 
> multiple ruby interpreters / runtimes easy and consistent, it provides features 
> such as gemsets that aren't typically supported out of the box on most ruby installs.
> from: https://rvm.io/rvm/basics

1) Update apt:

    sudo aptitude update
2) Install curl:

    sudo aptitude install curl
3) Download and install RVM:

    \curl -L https://get.rvm.io | bash -s stable
4) Load RVM

    source ~/.rvm/scripts/rvm
5) Install RVM requirements:

    rvm requirements
6) Install latest Ruby version:

    rvm install ruby 
    
#####Second Method: package manager (apt-get aptitude)
    aptitude install ruby

#####Next, clone repo, initialize modules and install it.

    git clone https://github.com/niltonvasques/dotfiles.git

    cd dotfiles

    git submodule update --init --recursive

    ./install.rb or ruby install.rb

#####Disabling vim plugins
For disable some vim plugin, just deinit git module in bundle folder. 
For example, if you wish disable YouCompleteMe vim plugin just type this:

    git submodule deinit .vim/bundle/YouCompleteMe

To make tern_form_vim works, is needed make some configurations.

So, move to .vim/bundle/tern_for_vim/ and follow this instructions:

> Make sure you have node.js and npm installed (Tern is a JavaScript program), and install the tern server by running npm install in the bundle/tern_for_vim directory.
> Caution: Because the node process is not run using your standard shell, the NVM version of node.js won't work. You need a global node executable.
> Fonte: https://github.com/marijnh/tern_for_vim

![alt text](https://github.com/niltonvasques/dotfiles/raw/master/docs/res/ss.png "Screenshot")

###Contribute with the project


* Fork me
* Clone your fork
* Add the original project as upstream: `git remote add  upstream https://github.com/niltonvasques/dotfiles`
* `git fetch upstream`
* `git merge upstream/master`
* Create a branch: `git checkout -b your_branch_name`
* Do what you need
* `Commit` the changes and `push` it to your `branch`
* Create a `Pull Request`

__To keep your fork sync:__

* `git fetch upstream`
* `git checkout master`
* `git merge upstream/master`
* `git push origin master`
* [read more](https://help.github.com/articles/syncing-a-fork/)
