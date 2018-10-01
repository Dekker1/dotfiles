My very own dotfiles
========

Let's have some dotfiles!

### Installing
This repository is designed to be used as a Homesick CASTLE. The following commands should be used to symlink all dotfiles, install oh-my-zsh and run all other install scripts.

```bash
git clone git@github.com:Dekker1/dotfiles.git ~/.dotfiles
cd .dotfiles
./install
```

### Atom

To setup the Atom settings from the repository:
```bash
./atom_setup
```
This will backup your current atom setup to `atom/backup` and will install the configuration and packages as included in the repository.

To backup your settings into the repository:
```bash
./atom_copy
```

### Visual Studio Code

To setup the Visual Studio Code settings from the repository:
```bash
./vscode_setup
```
This will backup your current Visual Studio Code setup to `vscode/backup` and will install the configuration and packages as included in the repository.

To backup your settings into the repository:
```bash
./vscode_copy
```

### Other documentation
If I would ever be in the mood to document things.
