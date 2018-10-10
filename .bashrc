# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

# fortune is a simple program that displays a pseudorandom message
# from a database of quotations at logon and/or logout.
# Type: "pacman -S fortune-mod" to install it, then uncomment the
# following line:

#[[ "$PS1" ]] && archey && fortune -o
 
# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

PS1="\[\033[0;36m\]\u\[\033[0;32m\]@\h\[\033[1;30m\] \w\[\033[0m\] $ "
PS2="> "
PS3="> "
PS4="+ "
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"

# Try to keep environment pollution down, EPA loves us.
unset safe_term match_lhs

# Try to enable the auto-completion (type: "pacman -S bash-completion" to install it).
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Try to enable the "Command not found" hook ("pacman -S pkgfile" to install it).
# See also: https://wiki.archlinux.org/index.php/Bash#The_.22command_not_found.22_hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

#my list of aliases
alias sx="startx"
alias gohome="cd /home/$USER"
alias fucking="sudo"
alias gimme="yay -S"
alias sn="sudo nano"
alias sc="sudo cat"
alias sss="sudo systemctl start"
alias sse="sudo systemctl enable"
alias ssx="sudo systemctl stop"
alias ssr="sudo systemctl restart"
alias stfu="systemctl poweroff"
alias addpdfs="gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=all.pdf"


 # Pacman alias examples
 alias pacupg='sudo pacman -Syu'        # Synchronize with repositories and then upgrade packages that are out of date on the local system.
 alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
 alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file 
 alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
 alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
 alias pacrep='pacman -Si'              # Display information about a given package in the repositories
 alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
 alias pacloc='pacman -Qi'              # Display information about a given package in the local database
 alias paclocs='pacman -Qs'             # Search for package(s) in the local database

 # Additional pacman alias examples
 alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
 alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
 alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

#for rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

#for Ruby bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH=/home/john/.gem/ruby/2.3.0/bin:$PATH

#for pkgfile to find commands not found
source /usr/share/doc/pkgfile/command-not-found.bash

#for editing package builds in yaourt
export VISUAL="nano"

#default printer for at home prints
PRINTER=HP_OfficeJet_Pro_6970
export PRINTER

