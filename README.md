#dotfiles
========

My personal repo to store dotfiles used by some programs, like vim, tmux e etc.


###Instalation
---------------------
git clone https://github.com/niltonvasques/dotfiles.git

cd dotfiles

git submodule update --init --recursive

To make tern_form_vim works, is needed make some configurations.

So, move to .vim/bundle/tern_for_vim/ and follow this instructions:

> Make sure you have node.js and npm installed (Tern is a JavaScript program), and install the tern server by running npm install in the bundle/tern_for_vim directory.
> Caution: Because the node process is not run using your standard shell, the NVM version of node.js won't work. You need a global node executable.
> Fonte: https://github.com/marijnh/tern_for_vim

###Contribute with the project


* Fork me
* Clone your fork
* Add the original project as upstream: `git remote add  upstream https://github.com/niltonvasques/dotfiles`
* `git fetch upstream`
* `git merge upstream/master`
* Create a branch: `git checkout -b your_branch_name`
* Do what you need
* Commit the changes to your branch
* Create a `Pull Request`

__To keep your fork sync:__

* `git fetch upstream`
* `git checkout master`
* `git merge upstream/master`
* `git push origin master`
* [read more](https://help.github.com/articles/syncing-a-fork/)
