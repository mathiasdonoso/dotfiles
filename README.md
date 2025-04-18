# My dotfiles

## Requirements

Ensure you have the following installed on your system

### Git
```
sudo apt install git
```

### Stow
```
sudo apt install stow
```

## Instalation

First, checkout the dotfiles repo in your $HOME directory using git

```
git clone git@github.com/mathiasdonoso/dotfiles.git
cd dotfiles
```

Then use GNU stow to create symlinks

```
stow .
```

Use --adapt flag if there are existing files
