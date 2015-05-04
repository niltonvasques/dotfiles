## How to install spell checker in vim

### Installing

Download dictionary of words from [libreoffice vero project](https://pt-br.libreoffice.org/projetos/vero/#baixarvero).

    wget https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBRV320AOC.oxt

Extract it.

    unzip -x VeroptBRV320AOC.oxt

Open vim.

    vim

Compile files.

    :mkspell pt pt_BR

Create spell directory if it not exists and copy pt.utf-8.spl file to it.
You can copy it to /usr/share/vim/vim74/spell directory if you want.

    mkdir ~/.vim/spell
    cp pt.utf-8.spl ~/.vim/spell/

### Setting up

To enable spell checker inside vim.

    :set spell spelllang=pt

Or enable definitive putting this in your vimrc file.

    echo ":set spell spelllang=pt" >> .vimrc

You can create a alias in your `.bash_aliases` file, for open vim with spell enable using a different command.
So append this line you `.bash_aliases` file:

    alias vimspell="vim -c 'set spell spelllang=pt,en'"



