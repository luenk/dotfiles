# Dotfiles Management

this is a repo for my personal dotfiles. The dotfile management is done by a makefile because I wanted to play with make and its syntax.  

If you are looking for a good dotfile management solution - give GNU stow a try

## Setup

Clone this repository and run
```bash
make clean
make link
```

`make clean` is creating a backup in `~/.backup` directory.

The nvim part is highly inspired by the talk  
"How to turn Vim into a powerful and beautiful IDE | Jess Archer, Vimconf 2021"  
https://www.youtube.com/watch?v=434tljD-5C8  
https://github.com/jessarcher/dotfiles

