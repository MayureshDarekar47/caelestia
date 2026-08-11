# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Created by `pipx` on 2026-05-31 15:28:42
export PATH="$PATH:/home/mayuresh/.local/bin"


#Mayuresh Darekar created

#alias nv="cd /run/media/$USER/New\ Volume"
#alias windows="cd /run/media/$USER/Windows-SSD"


#nv() {
#    if ! mountpoint -q "/run/media/$USER/New Volume"; then
#        udisksctl mount -b /dev/nvme0n1p4 >/dev/null 2>&1
#    fi
#    cd "/run/media/$USER/New Volume"
#}


#nv() {
#    if [ ! -e /dev/mapper/bitlk-aa422657-a79b-4bd4-b38f-8fd11a95003c ]; then
#        udisksctl unlock -b /dev/nvme0n1p4 || return
#    fi

#    udisksctl mount -b /dev/mapper/bitlk-aa422657-a79b-4bd4-b38f-8fd11a95003c >/dev/null 2>&1

#    cd "/run/media/$USER/New Volume"
#}

#windows() {
#    if [ ! -e /dev/mapper/bitlk-e23803a2-bf53-4f86-85cf-1a0854be8f25 ]; then
#        udisksctl unlock -b /dev/nvme0n1p3 || return
#    fi

#    udisksctl mount -b /dev/mapper/bitlk-e23803a2-bf53-4f86-85cf-1a0854be8f25 >/dev/null 2>&1

#    cd "/run/media/$USER/Windows-SSD"
#}


# koi fi folder open karne ke liye
shopt -s globstar



#shortcut  Mayuresh Darekar 

#run(){ g++ "$1" && ./a.out; }



nv() {
   sudo -v || return

    if ! mountpoint -q "/run/media/$USER/New Volume"; then
        udisksctl mount -b /dev/nvme0n1p4 >/dev/null 2>&1
    fi

    cd "/run/media/$USER/New Volume"
}




windows() {
  sudo -v || return

    if ! mountpoint -q "/run/media/$USER/Windows-SSD"; then
        udisksctl mount -b /dev/nvme0n1p3 >/dev/null 2>&1
    fi
    cd "/run/media/$USER/Windows-SSD"
}




coding() {
    nv || return
    cd "/run/media/$USER/New Volume/All Coding/Coding"
}



cpp() {
    nv || return
    cd "/run/media/$USER/New Volume/All Coding/Coding/C++"
}



#shotcut coding language.
run() {
    if [ $# -eq 0 ]; then
        echo "Usage: run <file>"
        return 1
    fi

    file="$1"

    case "${file##*.}" in
        cpp)
            echo "Compiling C++..."
            g++ -std=c++20 -Wall "$file" -o "${file%.*}" &&
            "./${file%.*}"
            ;;

        c)
            echo "Compiling C..."
            gcc "$file" -o "${file%.*}" &&
            "./${file%.*}"
            ;;

        py)
            python3 "$file"
            ;;

        java)
            javac "$file" &&
            java "${file%.*}"
            ;;

        js)
            node "$file"
            ;;

        ts)
            npx ts-node "$file"
            ;;

        go)
            go run "$file"
            ;;

        rs)
            rustc "$file" -o "${file%.*}" &&
            "./${file%.*}"
            ;;

        sh)
            bash "$file"
            ;;

        html)
            xdg-open "$file" >/dev/null 2>&1 &
            ;;

        php)
            php "$file"

            ;;

        *)
            echo "Unsupported file type."
            ;;
    esac
}




#ye ik  file banane ka shortcut hai c++ 
newcpp() {
    if [ $# -eq 0 ]; then
        echo "Usage: newcpp <filename>"
        return 1
    fi

    cat > "$1.cpp" << EOF
#include <iostream>
using namespace std;

int main() {

    return 0;
}
EOF

    code "$1.cpp"
}


#pendrive shotcut
#pendrive() {
#    local dev="/dev/sda1"
#   local mountpoint="/run/media/$USER/WINRE_DR"

#    if [ ! -b "$dev" ]; then
#        echo "Pendrive is not connected."
#        return 1
#    fi

#    if ! mountpoint -q "$mountpoint"; then
#        udisksctl mount -b "$dev" || return 1
#    fi

#    cd "$mountpoint" || return 1
#    ls
#}

pendrive() {
    local label="USB"
    local dev
    local mountpoint

    dev=$(blkid -L "$label")

    if [ -z "$dev" ]; then
        echo "Pendrive '$label' is not connected."
        return 1
    fi

    mountpoint=$(findmnt -nr -o TARGET "$dev")

    if [ -z "$mountpoint" ]; then
        udisksctl mount -b "$dev" >/dev/null || return 1
        mountpoint=$(findmnt -nr -o TARGET "$dev")
    fi

    cd "$mountpoint" || return 1

    
}
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
