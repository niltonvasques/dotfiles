current_dir=$(pwd)

echo $current_dir

for i in .*; do 
	if [ $i != '.git' ] &&  [ $i != '.' ] && [ $i != '..' ] && [[ $i != *.swp ]]

	then
		target=$current_dir/$i
		echo 'removing '~/$i;  
		rm ~/$i -f;
		echo 'creating symlink '~/$i ' -> '$target;  
		ln -s $target ~/$i;
	fi
done
echo 'install dotfiles finished';  
