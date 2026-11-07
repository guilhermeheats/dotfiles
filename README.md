# Dotfiles
>Arquivos de configuração do shell (zsh e bash).

[![CI](https://github.com/guilhermeheats/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/guilhermeheats/dotfiles/actions)
## O que tem:

| Arquivo | Papel |
|---|---|
| `.zshrc` | Config do zsh (oh-my-zsh + powerlevel10k, plugins, zoxide) |
| `.p10k.zsh` | Tema do powerlevel10k (gerado pelo `p10k configure`) |
| `.aliases` | Aliases e funções (dashboard, atalhos) |
| `.bashrc` | Config do bash |
| `install.sh` | Instala o ambiente completo (zsh, plugins, cht.sh + completion) |
| `completions/_cht` | Autocomplete do cht.sh para o zsh |

---
## Como os arquivos são usados:

Os arquivos reais moral neste; o home tem **syslinks** apontando para cá:

- `~/.zshrc` → `~/Projects/dotfiles/.zshrc` (e o mesmo para `.aliases`, `.p10k.zsh` e `.bashrc`)

Assim, toda edição já nasce versionada - Bastando commitar.

---
## Instalar em um PC novo:

```bash
git clone git@github.com:guilhermeheats/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles && ./install.sh
```

---
