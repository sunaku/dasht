* Code: <https://github.com/sunaku/dasht>
* Docs: <https://sunaku.github.io/dasht/man>
* Bugs: <https://github.com/sunaku/dasht/issues>

# Search API docs offline, in your terminal or browser

dasht is a collection of shell scripts for searching, browsing, and managing
API documentation (in the form of [200+ offline documentation sets][docsets],
courtesy of [Dash for macOS][Dash]) all from the comfort of your own terminal!

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

[gawk]: https://www.gnu.org/software/gawk/

* [gawk] for dasht-server(1) search engine

Development:

[binman]: https://sunaku.github.io/binman/
[md2man]: https://sunaku.github.io/md2man/

* [binman] and [md2man] to build manual pages

        gem install binman md2man

## Installation

Using a package manager:

[![Packaging status](https://repology.org/badge/vertical-allrepos/dasht.svg)](https://repology.org/project/dasht/versions)

Manually, on any system:

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

You may optionally configure the `DASHT_CACHE_DIR` environment variable, which
defines the filesystem location where download links and downloaded docset
archives are cached. If undefined, its value is assumed to be
`$XDG_CACHE_HOME/dasht/` or, if `XDG_CACHE_HOME` is also undefined,
`$HOME/.cache/dasht/`.

## Development

If you make changes to the embedded manual pages found in the comment headers
at the top of script files in the `bin/` directory, then remember to run the
`binman-rake` command afterward to regenerate UNIX manual pages for packaging.

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? 👍 Please [spare a life] today as thanks! 🐄🐖🐑🐔🐣🐟✨🙊✌  
> Why? For 💕 ethics, the 🌎 environment, and 💪 health; see link above. 🙇

(the ISC license)

Copyright 2016 Suraj N. Kurapati <https://github.com/sunaku>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(the GPL license)

A small portion of the dasht-query-exec(1) script was derived from [Zeal](
https://zealdocs.org ), which is licensed under the GNU General Public
License.  Refer to the `bin/dasht-query-exec` file for more information.
