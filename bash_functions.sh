#!/bin/bash
##################################
# UTILITY FUNCTIONS
#################################
function countdown() {
  date1=$((`date +%s` + $1));
  while [ "$date1" -ne `date +%s` ]; do
    echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
  done
}

function stopwatch() {
  date1=`date +%s`;
  while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
  done
}

function waitkey() {
  (tty_state=$(stty -g)
  stty -icanon
  LC_ALL=C dd bs=1 count=1 >/dev/null 2>&1
  stty "$tty_state"
  ) </dev/tty
}

function play_youtube(){
  mplayer -fs -quiet $(youtube-dl -g -t "$1")
}

function play_youtube_audio(){
 mplayer -vo null $(youtube-dl -g -t --extract-audio --audio-format mp3 "$1")
}
function play_youtube_mp3(){
  wget -q -O - `youtube-dl -g -t --extract-audio $1`| ffmpeg -i - -f mp3 -vn -acodec libmp3lame -| mpg123  -
}

# Iterate through a youtube list of links and play only mp3
# PARAMS:
# $1 : URLS_FILE_PATH
# The URLS_FILE must respect that structure:
# YOUTUBE_URL_1
# YOUTUBE_URL_2
# ...
# YOUTUBE_URL_N
function yt_pl(){
 COUNT=1;
 for url in $(cat $1); do
   echo "Playing $COUNT/$(wc -l $1) - $url";
   COUNT=$((COUNT+1));
   play_youtube_mp3 $url;
 done
}

apk_install() {
  find . -name *.apk | xargs -I {} adb install -r {}
}

#### Use it inside folder where the video is present!
## Converts a video (.mov) to gif (.gif).
## If no params is passed, the 'a.mov' video will be converted to 'a.gif' gif
## If a param is passed, the 'param.mov' video will be converted to a 'param.gif' gif
# Usage1: video_to_gif 'mymovie'
# Usage2: video_to_gif
video_to_gif() {
  if [[ "${#1}" > 0 ]]; then
    if [[ $((`ls | grep "$1" | wc -m`)) > 0 ]]; then
      #ffmpeg -i "$1" -s 600x250 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=10 > "$1.gif";
      #ffmpeg -i "$1" -s 660x350 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=3 --delay=10 > "$1.gif";
      if [ "$2" == "mobile" ]; then
        ffmpeg -i "$1" -s 412x660 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=3 --delay=10 > "$1.gif";
      fi
      if [ "$2" == "web" ]; then
        ffmpeg -i "$1" -s 1220x700 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=3 --delay=10 > "$1.gif";
      fi
    else
      echo "There is no file named: $1";
    fi
  else
    echo `ls | grep 'a.mov' | wc -m`;
    if [[ $((`ls | grep 'a.mov' | wc -m`)) > 0 ]]; then
      ffmpeg -i a.mov -s 919x443 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=10 > a.gif;
    else
      echo 'There is no file named: a.mov';
    fi
  fi
  # Greetings to...
  # https://gist.github.com/vitorleal/563771e821cef668eef5
}

ffind() {
  find . -name \*$1\*
}

multissh_tmux() {
  if [ -z "$HOSTS" ]; then
    echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
    read HOSTS
  fi

  local hosts=( $HOSTS )
  local target="ssh-multi ${host[0]}"

  tmux new-window -n "${target}" ssh ${hosts[0]}
  unset hosts[0];
  for i in "${hosts[@]}"; do
    tmux split-window -t :"${target}" -h  "ssh $i"
    tmux select-layout -t :"${target}" tiled > /dev/null
  done
  tmux select-pane -t 0

  if [ "$1" == "sync" ]; then
    tmux set-window-option -t :"${target}"  synchronize-panes on > /dev/null
  fi
}

multissh_tmux_sync() {
  if [ -z "$HOSTS" ]; then
    echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
    read HOSTS
  fi

  local hosts=( $HOSTS )
  local target="ssh-multi ${host[0]}"

  if [ "$1" == "on" ]; then
    tmux set-window-option -t :"${target}"  synchronize-panes on > /dev/null
  fi
  if [ "$1" == "off" ]; then
    tmux set-window-option -t :"${target}"  synchronize-panes off > /dev/null
  fi
}

redukt_tmux() {
  local target="ssh-multi redukt"

  tmux new-window -n "${target}" 'adb logcat -c && adb logcat | grep -E "Redukt> has start"'
  tmux split-window -t :"${target}" -h  'adb logcat -c && adb logcat | grep -i objectbox'
  tmux select-layout -t :"${target}" tiled > /dev/null
  tmux split-window -t :"${target}" -h  'adb logcat -c && adb logcat | grep "has start \[SYNC_DONE"'
  tmux select-layout -t :"${target}" tiled > /dev/null
  tmux split-window -t :"${target}" -h  'adb logcat -c && adb logcat | grep "POST\|PUT\|DELETE"'
  tmux select-layout -t :"${target}" tiled > /dev/null
  tmux select-pane -t 0
}

## FZF - function utilities
# https://github.com/junegunn/fzf/wiki/examples#changing-directory

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# fh - repeat history
runcmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, <>' ; }

fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --tac | sed -re 's/^\s*[0-9]+\s*//' | runcmd
}

# fhe - repeat history edit
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}
