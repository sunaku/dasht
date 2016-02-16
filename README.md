* Code: <https://github.com/sunaku/dasht>
* Docs: <https://sunaku.github.io/dasht/man>
* Bugs: <https://github.com/sunaku/dasht/issues>

# dasht - API documentation in your terminal

dasht is a collection of shell scripts for searching, browsing, and managing
API documentation (provided by [Dash] in the form of [docsets] for numerous
languages, libraries, and tools) all from the comfort of your own terminal!

The name "dasht" is a portmanteau of [Dash] and the letter "t", for terminal.
Etymologically, "dasht" is Persian for _plain_, as in an flat expanse of land,
which aptly characterizes the terminal environment where everything is text.

[Dash]: https://kapeli.com/dash
[docsets]: https://kapeli.com/docset_links

## Features

* You never have to leave your terminal!

* Local search engine for web browsers.

* Keep [Dash] docsets anywhere you like.

## Screenshots

![In your terminal](https://github.com/sunaku/dasht/raw/gh-pages/terminal.png)
![In your browser](https://github.com/sunaku/dasht/raw/gh-pages/browser.png)

## Dependencies

Required:

* [POSIX] environment (Linux, BSD, etc.)
  [POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

* [sqlite3] to search inside [Dash] docsets
  [sqlite3]: https://www.sqlite.org/cli.html

Optional:

* [w3m] to display dasht(1) search results
  [w3m]: http://w3m.sourceforge.net/

* [wget] to download [docsets] from [Dash]
  [wget]: https://www.gnu.org/software/wget/

* [socat] for dasht-server(1) search engine
  [socat]: http://www.dest-unreach.org/socat/

Development:

* [binman] and [md2man] to build manual pages
  [binman]: https://sunaku.github.io/binman/
  [md2man]: https://sunaku.github.io/md2man/

        gem install binman md2man

## Installation

1.  Clone or [download] this Git repository onto your system.
[download]: https://github.com/sunaku/dasht/archive/master.zip

    Note: [Arch Linux](https://www.archlinux.org) users may choose to install
    [this AUR package](https://aur.archlinux.org/packages/dasht-git/)
    maintained by [Christian Höppner](https://github.com/mkaito).

2.  Add the `bin/` folder to your `$PATH` environment variable:

        export PATH=$PATH:location_where_you_cloned_or_downloaded_dasht/bin

## Configuration

### `$DASHT_DOCSETS_DIR`

This environment variable specifies where your [Dash] docsets are installed.
If unspecified, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`, or
`$HOME/.local/share/dasht/docsets/` if `$XDG_DATA_HOME` is also unspecified.

## Usage

### Tutorial

First, install some [docsets] using dasht-docsets-install(1):

    dasht-docsets-install bash

Next, perform a direct search from the terminal using dasht(1):

    dasht 'c - x'

Then, repeat the search in a web browser using dasht-server(1):

    dasht-server

You are now ready to use dasht!  Read the manuals below to learn even more.

### Manuals

* You can browse the manuals online at <https://sunaku.github.io/dasht/man/>.

* If you installed dasht from your system's package manager, run `man dasht`.

* Else, run `man -M location_where_you_cloned_or_downloaded_dasht/man dasht`.

## Development

If you make changes to the embedded manual pages found in the comment headers
at the top of script files in the `bin/` directory, then remember to run the
`binman-rake` command afterward to regenerate UNIX manual pages for packaging.

## License

Distributed under the terms of the ISC license (see the LICENSE file).
