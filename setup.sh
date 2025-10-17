#!/bin/bash 

set -euo pipefail
XDG_CONFIG_HOME="$HOME/.config"

if command -v zsh > /dev/null; then 
	sudo chsh -s "$(command 0v zsh)" "$USER"
fi

if ! command -v chezmoi >/dev/null; then
	sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:crpruett/dotfiles.git
fi

if [ ! -d "$HOME/.zsh" ]; then
	mkdir -p "$HOME/.zsh"
fi

if [ ! -d "$HOME/.zsh/pure" ]; then
	git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi


#sudo apt update


#sudo apt install vim tmux bash-completion

#sudo usermod -aG sudo,gindev gindev || true

echo "Cowabunga dude!"
exit 0
