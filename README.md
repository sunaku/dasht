* Code: <https://github.com/sunaku/dasht>
* Docs: <https://sunaku.github.io/dasht/man>
* Bugs: <https://github.com/sunaku/dasht/issues>

# Search API docs offline, in your terminal or browser

dasht is a collection of shell scripts for searching, browsing, and managing
API documentation (in the form of [150+ offline documentation sets][docsets],
courtesy of [Dash for OS X][Dash]) all from the comfort of your own terminal!

The name "dasht" is a portmanteau of [Dash] and the letter "t", for terminal.
Etymologically, "dasht" is Persian for _plain_, as in an flat expanse of land,
which aptly characterizes the terminal environment where everything is text.

[Dash]: https://kapeli.com/dash
[docsets]: https://kapeli.com/dash#docsets

## Features

* You never have to leave your terminal!

* Local search engine for web browsers.

* Keep [Dash] docsets anywhere you like.

### Preview

Watch the "[dasht in a terminal](https://vimeo.com/159462598)"
and "[dasht in a browser](https://vimeo.com/159462774)" screencasts.

![In your terminal](https://github.com/sunaku/dasht/raw/gh-pages/terminal.png)
![In your browser](https://github.com/sunaku/dasht/raw/gh-pages/browser.png)

## Dependencies

Required:

[POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

* [POSIX] environment (Linux, BSD, etc.)

[sqlite3]: https://www.sqlite.org/cli.html

* [sqlite3] to search inside [Dash] docsets

Optional:

[wget]: https://www.gnu.org/software/wget/

* [wget] to download [docsets] from [Dash]

[w3m]: http://w3m.sourceforge.net/

* [w3m] to display dasht(1) search results

[socat]: http://www.dest-unreach.org/socat/

* [socat] for dasht-server(1) search engine

Development:

[binman]: https://sunaku.github.io/binman/
[md2man]: https://sunaku.github.io/md2man/

* [binman] and [md2man] to build manual pages

        gem install binman md2man

## Installation

In Arch Linux:

* Install [dasht](https://aur.archlinux.org/packages/dasht/) or
  [dasht-git](https://aur.archlinux.org/packages/dasht-git/) from the AUR,
  maintained by [Christian Höppner](https://github.com/mkaito).

In MacOS (Homebrew):
```
 brew install dasht
```
 
On any system:

[download]: https://github.com/sunaku/dasht/releases
[clone]: https://github.com/sunaku/dasht.git

1.  [Download] a stable release or [clone] this Git repository.

2.  Add the `bin/` folder to your `PATH` environment variable:

        export PATH=$PATH:location_where_you_cloned_or_downloaded_dasht/bin

3.  Add the `man/` folder to your `MANPATH` environment variable:

        export MANPATH=location_where_you_cloned_or_downloaded_dasht/man:$MANPATH

### Vim integration

Use the [vim-dasht](https://github.com/sunaku/vim-dasht) plugin for (Neo)Vim.

### ZSH integration

Source this file in ZSH to activate TAB completion for dasht:

    source location_where_you_cloned_or_downloaded_dasht/etc/zsh/completions.zsh

Or simply add the completions/ directory to your ZSH $fpath
if you've already set up ZSH's completion system elsewhere:

    fpath+=location_where_you_cloned_or_downloaded_dasht/etc/zsh/completions/

## Usage

First, install some [docsets] using dasht-docsets-install(1):

    dasht-docsets-install bash

Next, perform a direct search from the terminal using dasht(1):

    dasht 'c - x'

Then, repeat the search in a web browser using dasht-server(1):

    dasht-server

You are now ready to use dasht!  Read the manuals below to learn even more.

### Manuals

* You can browse the manuals online at <https://sunaku.github.io/dasht/man/>.

* If you set `$MANPATH` or installed from a package manager, run `man dasht`.

* Else, run `man -M location_where_you_cloned_or_downloaded_dasht/man dasht`.

### Configuration

You may optionally configure the `DASHT_DOCSETS_DIR` environment variable,
which defines the filesystem location where your [Dash] docsets are installed.
If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/` or,
if `XDG_DATA_HOME` is also undefined, `$HOME/.local/share/dasht/docsets/`.

You may optionally configure the `DASHT_CACHE_DIR` environment variable,
which defines the filesystem location where download links are cached.
If undefined, its value is assumed to be `$XDG_CACHE_HOME/dasht/`
or, if `XDG_CACHE_HOME` is also undefined, `$HOME/.cache/dasht/`.

## Development

If you make changes to the embedded manual pages found in the comment headers
at the top of script files in the `bin/` directory, then remember to run the
`binman-rake` command afterward to regenerate UNIX manual pages for packaging.

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? :+1:  Please [spare a life] today as thanks!
:cow::pig::chicken::fish::speak_no_evil::v::revolving_hearts:

Copyright 2016 Suraj N. Kurapati <https://github.com/sunaku>

Distributed under the terms of the ISC license (see the LICENSE file).
