# funcoo.vim

This Vim plugin is a library intended for use by other plugins.

It introduces Object Oriented constructs to VimL based on prototypes
and has some functional modules.

It's still under development, does not have any documentation, so the
best way to see what it does would be by example.

For a more basic usage, check [dash.vim][dash].  
For a more advanced usage, check [greper.vim][greper].

If that got you interested, only then I recommend you actually check
funcoo's code. Seriously.

## Installation

### Using [Vundle][vundle]:

Just add this line to your `~/.vimrc`:

```vim
Bundle 'rizzatti/funcoo.vim'
```

And run `:BundleInstall` inside Vim.

### Using [pathogen.vim][pathogen]:

Copy and paste in your shell:

```bash
cd ~/.vim/bundle
git clone https://github.com/rizzatti/funcoo.vim.git
```

## License

MIT

[dash]: https://github.com/rizzatti/dash.vim
[greper]: https://github.com/rizzatti/greper.vim
[pathogen]: https://github.com/tpope/vim-pathogen
[vundle]: https://github.com/gmarik/vundle
