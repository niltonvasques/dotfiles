
confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
           true 
            ;;
        *)
           false 
            ;;
    esac
}

current_dir=$(pwd)

echo $current_dir

for i in .*; do 
	if [ $i != '.git' ] &&  [ $i != '.' ] \
		&& [ $i != '..' ] && [ $i != '.gitignore' ] \
		&& [ $i != '.gitmodules' ] && [[ $i != *.swp ]]

	then
		target=$current_dir/$i
		file=$HOME"/"$i
		echo $file "will be removed"
		if ( confirm )
		then
			echo 'removing '$file;  
			rm $file -Rf;
			echo 'creating symlink '$file ' -> '$target;  
			ln -s $target $file;
		fi
	fi
done
ln -s $current_dir/powerline/fonts/PowerlineSymbols.otf $HOME/.fonts/PowerlineSymbols.otf
fc-cache -vf $HOME/.fonts/
ln -s $HOME/Development/Linux/dotfiles/powerline/fonts/10-powerline-symbols.conf $HOME/.fonts/fontconfig/conf.d/10-powerline-symbols.conf
echo 'install dotfiles finished';  


