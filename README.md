#dotfiles

My personal repo to store dotfiles used by some programs, like vim, tmux e etc.

###Instalation
---------------------

    
#####Install ruby interpreter
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

###Plugins
-----------------------

#####Ctrl-P
Super ultra fast fuzzy finder for files. After use it once, you never more you want open files by old way.

#####Emmet
HTML tag generator. 
Try:
    html:5<ctrl-y> + <,>

#####DelimitMate
Auto close brackets for you.

#####Vim Airline
Just fancy, layout and colors for vim bar.

#####Vim Increment Lines
Auto increment numbers in a column.
For use try it:

    0
    0
    0

Select columns using <ctrl+v> in visual mode, and press <ctrl-a>.
And the lines will be changed to:

    1
    2
    3

#####YouCompleteMe plugin 
YouCompleteMe only works in vim with Python Support
So, follow instructions from YouCompleteMe repo, about how compile vim from source, and enable python..

    [Installing vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)

#####Tern for vim (Javascript intellisense)
To make tern_form_vim works, is needed make some configurations.

So, move to .vim/bundle/tern_for_vim/ and follow this instructions:

> Make sure you have node.js and npm installed (Tern is a JavaScript program), and install the tern server by running npm install in the bundle/tern_for_vim directory.
> Caution: Because the node process is not run using your standard shell, the NVM version of node.js won't work. You need a global node executable.
> Fonte: https://github.com/marijnh/tern_for_vim

![alt text](https://github.com/niltonvasques/dotfiles/raw/master/docs/res/ss-new.png "Screenshot")

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
