#dotfiles

My personal repo to store dotfiles used by some programs, like vim, tmux e etc.

###Instalation
---------------------


##### Requirements

    pip3 install neovim
    apt-get install ruby
    gem install neovim

#####Next, clone repo, initialize modules and install it.

    git clone https://github.com/niltonvasques/dotfiles.git

    cd dotfiles

    git submodule update --init --recursive

    ./install.rb or ruby install.rb

##### Setup diff-so-fancy on GIT

```sh
git clone https://github.com/so-fancy/diff-so-fancy.git
# add diff-so-fancy to PATH variable on .bashrc

# setup git to use it
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
```


###Plugins
-----------------------

#### Installing vim plugins

Inside vim:

    :PlugInstall

##### Disabling vim plugins
For disable some vim plugin, just deinit git module in bundle folder.
For example, if you wish disable YouCompleteMe vim plugin just type this:

    git submodule deinit .vim/bundle/YouCompleteMe

#### Descriptions

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

##### Deoplete
An auto complete async plugin for neovim

Type <C-x><C-o> to get completion list.

Tested with ruby, javascript, java and python.

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
