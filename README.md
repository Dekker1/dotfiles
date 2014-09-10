My very own dotfiles
========

Let's have some dotfiles!

### Installing
This repository is designed to be used as a Homesick CASTLE. The following commands should be used to symlink all dotfiles, install oh-my-zsh and run all other install scripts.

```bash
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
gem install homesick
homesick clone jjdeker/dotfiles
homesick exec dotfiles ./gitsetup
homesick link dotfiles
```

### Sublime Text 3

To setup the sublime text 3 settings from the repository:
```bash
homesick exec dotfiles ./subl_setup
```

To backup your settings into the repository:
```bash
homesick exec dotfiles ./subl_copy
```

### Other documentation
If I would ever be in the mood to document things.
