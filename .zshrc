[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
#!/bin/sh

#history
HISTFILE=/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/starship.zsh"
plug "$HOME/.config/zsh/conda.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/exa"
plug "lukechilds/zsh-nvm"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/go/bin

export PATH=$PATH:$HOME/.local/bin

alias air='~/go/bin/air'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/home/t8/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/t8/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
