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
