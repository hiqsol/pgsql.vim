pgsql.vim
=========

**Vim PostgreSQL syntax file**

Provides syntax highlighting for PostgreSQL specific SQL files.

## Installation

Use [Vundle](https://github.com/VundleVim/Vundle.vim).

Place this in your `.vimrc`:

```vim
Plugin 'hiqsol/pgsql.vim'
```

… then run the following in Vim:

```vim
:source %
:PluginInstall
```

## Usage

Files with the suffix `.pgsql` will use the pgsql highlighting automatically.

To enable `pgsql` syntax for any open buffer, use:

    :set syntax=pgsql

You can make `pgsql.vim` the default for SQL syntax by adding this line to your `.vimrc`:

```
    let g:sql_type_default = 'pgsql'
```

This tells the `sql.vim` module to use the `pgsql` dialect.

Alternately, you can use an autocmd in your `~/.vim/filetype.vim` to enable it
for all `.sql` files or some finer pattern:

```vim
    autocmd BufNewFile,BufRead *.sql setf pgsql
```

You do not need both. If in doubt, use the first method.

## Acknowledgements

This plugin is based on https://github.com/exu/pgsql.vim
