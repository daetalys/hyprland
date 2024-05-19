#    ____            __        __      __  _
#   / __ \____ ___  / /_____ _/ /_  __/ /_(_)________ _
#  / / / / __ ` _ \/ __/ __ `/ / / / / __/ / ___/ __ `/
# / /_/ / /_/   __/ /_/ /_/ / / /_/ / /_/ / /__/ /_/ /
#/_____/\__,_____/\__/\__,_/_/\__, /\__/_/\___/\__,_/
#                            /____/
#  https://daetalytica.io   oracle@daetalytica.io
#               .^~.            .~^.
#            :^^!~.              .~!^^:
#         :^^:.^^                  ^^.:^^:
#      .^^:. .~^                    ^~. .:^^.
#      :!   :!^^^:..:^^:.  .:^^:..:^^^!:   !:
#      :!   :^^::::^~:.:^~~^:.:~^::::^^.   !:
#      .^^^:   .:^^::.   ^^   .::^^:.   :^^^.
#     ^~  .:^^:.   ^!^   ^^   ^!^.  .:^^:.  ~^
#     !7~.   .:^^:.      ^^      .:^^:.   .~7!.
#    .!!7!~:.    .^^^:.  ^^  .:^^^.    .:~!7!!.
#     ^7!!77!~^:.   .^!: ^^ :!~.   .:^~!77!!7^
#      ^77!!!!77!~^:     ^^     :^~!77!!!!7!^
#       :~!77^:!!777!:   ^^   :!777!!^^!7!~.
#         .:^^ :!!!!~!~  ^^  ~!~!!!!: ^^:.
#               !!!! .~: ^^ :~. !!!!
#              .!77~   . !! .   ~77!.
#              .^~!7!^.  ..  .^!7!~^.
#               ..:^!7!~.  .~!7!^:..
#               .:^^~7!7!^^!7!7~^^:.
#                  .:^!777777!^:.
#                      :!77!:
#                        ^^
#
# =============================================================================
# Environment Configuration Section
# -----------------------------------------------------------------------------
# This section defines various environment variables to configure the behavior
# of the shell, XDG directories, default applications, terminal settings,
# shell history, and user-specific and application-specific directories.
# The script also checks if the current shell is interactive and exits early
# if not, skipping the rest of the script.
# =============================================================================

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"             # User-specific configuration directory
export XDG_CACHE_HOME="$HOME/.cache"               # User-specific cache directory
export XDG_DATA_HOME="$HOME/.local/share"          # User-specific data directory
export XDG_STATE_HOME="$HOME/.local/state"         # User-specific state directory
export XDG_RUNTIME_DIR="/run/user/$UID"            # User-specific runtime directory (usually on a tmpfs)
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/daetalys/.local/share/flatpak/exports/share:/usr/local/share:/usr/share:${XDG_DATA_DIRS}" # System-wide data directories (colon-separated list)
export XDG_CONFIG_DIRS="/etc/xdg"                  # System-wide configuration directories (colon-separated list)

# XDG User Directories Specification
export XDG_DESKTOP_DIR="$HOME/Desktop"           # Desktop directory
export XDG_DOCUMENTS_DIR="$HOME/Documents"       # Documents directory
export XDG_DOWNLOAD_DIR="$HOME/Downloads"        # Downloads directory
export XDG_MUSIC_DIR="$HOME/Music"               # Music directory
export XDG_PICTURES_DIR="$HOME/Pictures"         # Pictures directory
export XDG_PUBLICSHARE_DIR="$HOME/Public"        # Public sharing directory
export XDG_TEMPLATES_DIR="$HOME/Templates"       # Templates directory
export XDG_VIDEOS_DIR="$HOME/Videos"             # Videos directory

# Terminal settings
export TERMINAL="foot"                      # Terminal emulator name
export TERM="xterm-256color"                     # Terminal type and capabilities (256-color support)
export COLORTERM="truecolor"                     # Terminal color mode (true color support)

# Default applications
export VISUAL="vscodium"                          # Default visual text editor
export EDITOR="vim"                               # Default command-line text editor
export ALTERNATE_EDITOR=""                        # Fallback editor for emacsclient
export READER="evince"                            # Default PDF/document viewer
export BROWSER="librewolf"                          # Default web browser
export PAGER="less"                               # Default pager for command output
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Default pager for man pages using bat with man syntax highlighting

# Shell history settings
export HISTCONTROL=ignoredups:erasedups          # Prevent duplicate entries in shell command history

# User-specific directories
if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ]; then
  PATH="$HOME/Applications:$PATH"
fi

# Application-specific directories
if [ -d "$HOME/.local/share/solana/install/active_release/bin" ]; then
  PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ]; then
  PATH="$HOME/.emacs.d/bin:$PATH"
fi

# System-wide directories
if [ -d "/var/lib/flatpak/exports/share" ]; then
  PATH="/var/lib/flatpak/exports/share:$PATH"
fi

if [ -d "$HOME/.local/share/flatpak/exports/share" ]; then
  PATH="$HOME/.local/share/flatpak/exports/share:$PATH"
fi

# SSH settings
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh" # Set the SSH_AUTH_SOCK environment variable to the socket path for the user-level ssh-agent service, enabling the shell to communicate with the agent for key management and authentication.

[[ $- != *i* ]] && return # Check if the current shell is interactive; if not, exit early and skip the rest of the script.

# Advanced command-not-found hook
#source /usr/share/doc/find-the-command/ftc.bash
#if [ -f /etc/bash.command-not-found ]; then
#    . /etc/bash.command-not-found
#fi

# =============================================================================
# Aliases Section
# -----------------------------------------------------------------------------
# This section contains aliases to simplify and customize your command-line
# experience. Aliases are short commands that map to longer or more complex
# commands. To add a new alias, simply follow the format:
#
#   alias <short_command>='<full_command>'
#
# Example:
#   alias ll='ls -la'
# =============================================================================

# Navigation: These aliases allow you to quickly navigate up multiple levels in the directory structure.

# Navigate up multiple levels in the directory structure
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# This function, named 'up', is used to navigate up a specified number
# of directory levels in the current directory hierarchy. It takes a single
# integer argument representing the number of levels to move up. If no
# argument is provided or if the argument is less than or equal to 0,
# it defaults to moving up one directory level. If the 'cd' command fails,
# an error message will be displayed.
#
# Usage:
#   up <levels>
#   where <levels> is a positive integer.
#
# Example:
#   up 2  # moves up two directory levels
up () {
  local d=""
  local limit="$1"

  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# File Operations: These aliases provide shortcuts for common file operations, often adding flags for interactive mode, human-readable format, or specific functionality.

# Interactive copy, move, and remove commands
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Display disk usage in human-readable format
alias df='df -h'

# Display memory usage in MB
alias free='free -m'

# Archive and extract files
alias tarnow='tar -acf '
alias untar='tar -zxvf '

# This shell function, named 'cx', simplifies the process of creating archives 
# from various directories. It takes two arguments - the directory to be 
# archived and the name of the archive file to be created. The function checks
# the archive file extension and applies the appropriate compression command.
# If the provided directory does not exist or is not a directory, an error
# message is displayed.
#
# Usage:
#   cx <directoryname> <filename>
#
# Example:
#   cx dir archive.tar.gz  # compresses the directory 'dir' into 'archive.tar.gz'
cx ()
{
  if [ -d "$1" ]; then
    case $2 in
      *.tar.bz2)   tar cjf $2 $1   ;;
      *.tar.gz)    tar czf $2 $1   ;;
      *.bz2)       bzip2 -c $1 > $2   ;;
      *.gz)        gzip -c $1 > $2    ;;
      *.tar)       tar cf $2 $1    ;;
      *.tbz2)      tar cjf $2 $1   ;;
      *.tgz)       tar czf $2 $1   ;;
      *.zip)       zip -r $2 $1     ;;
      *.7z)        7z a $2 $1      ;;
      *.tar.xz)    tar cJf $2 $1    ;;
      *.tar.zst)   tar --zstd -cf $2 $1    ;;
      *)           echo "'$2' is not a valid archive file extension for cx()" ;;
    esac
  else
    echo "'$1' is not a valid directory"
  fi
}

# This shell function, named 'ex', simplifies the process of extracting files
# from various archive formats. It takes a single argument, which should be
# the file you want to extract. The function checks the file extension and
# applies the appropriate extraction command. If the provided file does not
# exist or is not a regular file, an error message is displayed.
#
# Usage:
#   ex <filename>
#
# Example:
#   ex archive.tar.gz  # extracts the contents of the archive.tar.gz file
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Securely delete files
alias shred="shred -zf"

# Search and Sorting: These aliases are for searching and sorting various outputs, often adding color or other useful flags.

# Search with colored output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Display processes sorted by memory or CPU usage
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'

# Count installed git packages
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'

# Search processes by name
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psa="ps auxf"

# System Management: These aliases are for managing the system, like updating packages, managing mirrors, or working with dotfiles.

# Fix pacman lock issues
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# Update GRUB bootloader
alias grubup="sudo update-grub"

# Display hardware information
alias hw='hwinfo --short'

# Remove package without checking dependencies
alias rmpkg="sudo pacman -Rdd"

# Remove orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# # Update System and Generate Package Lists: This function updates system packages using pacman, AUR (with a supported AUR helper), Nix, Flatpak, and Snap, and then generates package lists for each package manager. It also creates a list of orphaned packages.
sysupdate() {
  # Check if pacaur, trizen, aura, yay, pikaur, or paru is installed, if yes, set AUR_HELPER and AUR_FLAGS
  AUR_HELPER=""
  AUR_FLAGS=""
  if command -v pacaur >/dev/null 2>&1; then
    AUR_HELPER="pacaur"
    AUR_FLAGS="-Sua"
  elif command -v trizen >/dev/null 2>&1; then
    AUR_HELPER="trizen"
    AUR_FLAGS="-Sua"
  elif command -v aura >/dev/null 2>&1; then
    AUR_HELPER="aura"
    AUR_FLAGS="-Akua"
  elif command -v yay >/dev/null 2>&1; then
    AUR_HELPER="yay"
    AUR_FLAGS="-Sua"
  elif command -v pikaur >/dev/null 2>&1; then
    AUR_HELPER="pikaur"
    AUR_FLAGS="-Sua"
  elif command -v paru >/dev/null 2>&1; then
    AUR_HELPER="paru"
    AUR_FLAGS="-Sua"
  fi

  # Get the XDG documents directory and create the PKGLIST directory
  DOCS_DIR="${XDG_DOCUMENTS_DIR:-${HOME}/Documents}"
  mkdir -p "${DOCS_DIR}/PKGLIST"

  # Update using pacman
  sudo pacman -Syu --noconfirm
  pacman -Qqn > "${DOCS_DIR}/PKGLIST/Native.txt"

  # Update AUR packages
  if [[ -n $AUR_HELPER ]]; then
    $AUR_HELPER $AUR_FLAGS --noconfirm
    pacman -Qqm > "${DOCS_DIR}/PKGLIST/Foreign.txt"
  fi

  # # Update Nix packages
  if command -v nix-channel >/dev/null 2>&1; then
    nix-channel --update
    nix-env -u
    nix-env -q > "${DOCS_DIR}/PKGLIST/Nix.txt"
  fi

  # Update Flatpaks
  if command -v flatpak >/dev/null 2>&1; then
    flatpak update
    flatpak list > "${DOCS_DIR}/PKGLIST/Flatpaks.txt"
  fi

  # Update Snaps
  if command -v snap >/dev/null 2>&1; then
    sudo snap refresh
    snap list > "${DOCS_DIR}/PKGLIST/Snaps.txt"
  fi

  # Get orphans list
  pacman -Qqdt > "${DOCS_DIR}/PKGLIST/Orphans.txt"
  pacman -Qqe > "${DOCS_DIR}/PKGLIST/Explicit.txt"
  pacman -Qqd | grep -Fxv -f "${DOCS_DIR}/PKGLIST/Orphans.txt" > "${DOCS_DIR}/PKGLIST/Dependencies.txt"
}

# Manage mirror lists
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Display pacman manual
alias apt-get='man pacman'
alias apt='man pacman'

# Update Xresources
alias merge='xrdb -merge ~/.Xresources'

# Manage git repositories
alias config="/usr/bin/git --git-dir=/.git --work-tree=/"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.git/ --work-tree=$HOME"

# Customizations and Wrappers: These aliases provide customizations, wrappers, or alternative commands to existing tools, making them more convenient or user-friendly.

# Display package size
alias big="expac -H M '%m\t%n' | sort -h | nl"

# Customize curl and wget with a user-agent
alias curl="curl --user-agent 'noleak'"
alias wget="wget -c --user-agent 'noleak'"

# Send output to termbin.com
alias tb="nc termbin.com 9999"

# Show high-priority systemd journal entries
alias jctl="journalctl -p 3 -xb"

# Wrappers for common tools
[ -x /usr/bin/bat ] && alias cat='bat --style header --style snip --style changes --style header'
[ -x /usr/bin/eza ] && alias ls='eza -al --color=always --icons --group-directories-first --git'
[ -x /usr/bin/lfrun ] && alias lf='lfrun'
[ -x /usr/bin/lvim ] && alias vim='lvim'
#[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Colorize 'ip' command output
alias ip="ip -color"

# Customize 'lynx', 'vifm', 'ncmpcpp', and 'mocp' commands with config paths
#alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='~/.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# Use 'meld' as a diff program for 'pacdiff'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Query cheat.sh for shell help
alias helpme='cht.sh --shell'

# Manage GPG keys
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Execute a rickroll script
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# =============================================================================
# Terminal Appearance Configuration Section
# -----------------------------------------------------------------------------
# This section customizes the appearance of the terminal, including the title
# of terminal windows, the shell prompt, and the display of random ASCII art
# with colors. It sets the terminal title based on the current user, hostname,
# and working directory. It checks for the presence of the starship prompt
# and loads it if installed. Finally, it runs the 'colorscript' command to
# display random ASCII art with colors in the terminal.
# =============================================================================

# CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Load starship prompt if starship is installed
if [ -x /usr/bin/starship ]; then
    __main() {
        local major="${BASH_VERSINFO[0]}"
        local minor="${BASH_VERSINFO[1]}"

        if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
            source <("/usr/bin/starship" init bash --print-full-init)
        else
            source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
        fi
    }
    __main
    unset -f __main
else
    # Use the default prompt if starship is not installed
    PS1='[\u@\h \W]\$ '
fi

colorscript random # Run the 'colorscript' command with the 'random' argument to display random ASCII art with colors in the terminal.
