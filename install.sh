#!/usr/bin/env bash
# 'install.sh' - ambiente zsh (dependências, plugins, cht.sh + completion) e syslinks dos dotfiles
# Uso: git clone git@github.com:guilhermeheats/dotfiles.git && cd dotfiles && ./install.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
warn() { printf '\033[1;33mAVISO: %s\033[0m\n' "$*"; }

# 1) pacotes do sistema
sudo apt-get install -y zsh zoxide surfraw w3m

# 2) oh-my-zsh (sem interação)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# 3) p10k + plugins do OMZ
custom="$HOME/.oh-my-zsh/custom"
[ -d "$custom/themes/powerlevel10k" ] ||
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$custom/themes/powerlevel10k"
[ -d "$custom/plugins/zsh-autosuggestions" ] ||
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$custom/plugins/zsh-autosuggestions"
[ -d "$custom/plugins/fast-syntax-highlighting" ] ||
  git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting "$custom/plugins/fast-syntax-highlighting"

# 4) cliente CLI do cht.sh + completion do zsh
mkdir -p "$HOME/.local/bin" "$HOME/.zsh/completions"
curl -fsSL https://cht.sh/:cht.sh -o "$HOME/.local/bin/cht.sh"
chmod +x "$HOME/.local/bin/cht.sh"
cp "$DOTFILES_DIR/completions/_cht" "$HOME/.zsh/completions/_cht"

# 5) syslinks dos dotfiles no HOME
for f in .zshrc .aliases .p10k.zsh .bashrc; do
  if [ -e "$HOME/$f" ]; then
    warn "$HOME/$f já existe - pulando"
  else
    ln -s "$DOTFILES_DIR/$f" "$HOME/$f"
  fi
done

# 6) shell padrão
chsh -s /usr/bin/zsh || warn "chsh falhou - Rode manualmente: 'chsh -s /usr/bin/zsh'"

printf 'Concluído! Feche e abra o terminal (ou rode: source ~/.zshrc)\n'
