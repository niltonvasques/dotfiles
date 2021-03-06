#!/bin/bash
# sourced from : http://www.sharms.org/blog/2012/08/gnome-terminal-color-schemes/

# ./Twilight.itermcolors
twilight()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FEFFD3"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#141414"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FEFFD3"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#141414:#C06C43:#AFB979:#C2A86C:#444649:#B4BE7B:#778284:#FEFFD3:#262626:#DD7C4C:#CBD88C:#E1C47D:#5A5D61:#D0DB8E:#8A989A:#FEFFD3"
}

# ./Zenburn.itermcolors
zenburn()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#DCDCCC"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#1F1F1F"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFCFAF"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000B13:#E89393:#9ECE9E:#F0DFAF:#8CD0D3:#C0BED1:#DFAF8F:#EFEFEF:#000B13:#E89393:#9ECE9E:#F0DFAF:#8CD0D3:#C0BED1:#DFAF8F:#FFFFFF"
}

# ./SolarizedLight.itermcolors
solarizedlight()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#52676F"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#FCF4DC"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#465A61"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#002731:#D01B24:#728905:#A57705:#2075C7:#C61B6E:#259185:#E9E2CB:#001E26:#BD3612:#465A61:#52676F:#708183:#5856B9:#81908F:#FCF4DC"
}

# ./Desert.itermcolors
desert()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FFFFFF"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#333333"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFD700"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#4D4D4D:#FF2B2B:#98FB98:#F0E68C:#CD853F:#FFDEAD:#FFA0A0:#F5DEB3:#555555:#FF5555:#55FF55:#FFFF55:#87CEFF:#FF55FF:#FFD700:#FFFFFF"
}

# ./SolarizedDark.itermcolors
solarizeddark()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#708183"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#001E26"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#81908F"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#002731:#D01B24:#728905:#A57705:#2075C7:#C61B6E:#259185:#E9E2CB:#001E26:#BD3612:#465A61:#52676F:#708183:#5856B9:#81908F:#FCF4DC"
}

# ./idleToes.itermcolors
idletoes()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FFFFFF"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#323232"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFFFA9"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#323232:#D25252:#7FE173:#FFC66D:#4098FF:#F57FFF:#BED6FF:#EEEEEC:#535353:#F07070:#9DFF90:#FFE48B:#5EB7F7:#FF9DFF:#DCF4FF:#FFFFFF"
}

# ./Homebrew.itermcolors
homebrew()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#00FF00"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#000000"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#00FF00"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#990000:#00A600:#999900:#0000B2:#B200B2:#00A6B2:#BFBFBF:#666666:#E50000:#00D900:#E5E500:#0000FF:#E500E5:#00E5E5:#E5E5E5"

}
# ./Dark Pastel.itermcolors
darkpastel()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FFFFFF"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#000000"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FF5E7D"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#FF5555:#55FF55:#FFFF55:#5555FF:#FF55FF:#55FFFF:#BBBBBB:#555555:#FF5555:#55FF55:#FFFF55:#5555FF:#FF55FF:#55FFFF:#FFFFFF"
}

# ./Terminal Basic.itermcolors
terminalbasic()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#000000"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#FFFFFF"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#000000"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#990000:#00A600:#999900:#0000B2:#B200B2:#00A6B2:#BFBFBF:#666666:#E50000:#00D900:#E5E500:#0000FF:#E500E5:#00E5E5:#E5E5E5"
}

# ./Pro.itermcolors
pro()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#F2F2F2"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#000000"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFFFFF"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#990000:#00A600:#999900:#1F08DB:#B200B2:#00A6B2:#BFBFBF:#666666:#E50000:#00D900:#E5E500:#0000FF:#E500E5:#00E5E5:#E5E5E5"
}

# ./Vaughn.itermcolors
vaughn()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#DCDCCC"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#25234E"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FF5E7D"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#24234F:#705050:#60B48A:#DFAF8F:#5555FF:#F08CC3:#8CD0D3:#709080:#709080:#DCA3A3:#60B48A:#F0DFAF:#5555FF:#EC93D3:#93E0E3:#FFFFFF"
}

# ./Novel.itermcolors
novel()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#3B2322"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#DFDBC3"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#8E2A19"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#CC0000:#009600:#D06B00:#0000CC:#CC00CC:#0087CC:#CCCCCC:#7F7F7F:#CC0000:#009600:#D06B00:#0000CC:#CC00CC:#0086CB:#FFFFFF"
}

# ./Ocean.itermcolors
ocean()
{
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FFFFFF"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#224FBC"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFFFFF"
	gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#990000:#00A600:#999900:#0000B2:#B200B2:#00A6B2:#BFBFBF:#666666:#E50000:#00D900:#E5E500:#0000FF:#E500E5:#00E5E5:#E5E5E5"
  echo "We love you Billy!"
}

# ./Red Sands.itermcolors
redsands()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#D7C9A7"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#79241E"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#DFBD22"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#FF3F00:#00BB00:#E7B000:#0071FF:#BB00BB:#00BBBB:#BBBBBB:#555555:#BB0000:#00BB00:#E7B000:#0071AE:#FF55FF:#55FFFF:#FFFFFF"
}

# ./Grass.itermcolors
grass()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#FFF0A5"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#13773C"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#FFB03B"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000:#BB0000:#00BB00:#E7B000:#0000A3:#950061:#00BBBB:#BBBBBB:#555555:#BB0000:#00BB00:#E7B000:#0000BB:#FF55FF:#55FFFF:#FFFFFF"
}

# ./Kibble.itermcolors
kibble()
{
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#F7F7F7"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#0E100A"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#CA631D"
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#4D4D4D:#C70031:#29CF13:#D8E30E:#3449D1:#8400FF:#0798AB:#E2D1E3:#5A5A5A:#F01578:#6CE05C:#F3F79E:#97A4F7:#C495F0:#68F2E0:#FFFFFF"
}


# Oh my THOR!
if [ -z $1 ]
then
  echo "Specify a theme as the first argument: "
  echo "--------------------------------------"
  echo "darkpastel"
  echo "desert"
  echo "grass"
  echo "homebrew"
  echo "idletoes"
  echo "kibble"
  echo "novel"
  echo "ocean"
  echo "pro"
  echo "redsands"
  echo "solarizeddark"
  echo "solarizedlight"
  echo "terminalbasic"
  echo "twilight"
  echo "vaughn"
  echo "zenburn"
  echo "--------------------------------------"
else
  # Do it!
  $1
fi