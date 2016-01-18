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

* Keep [Dash] docsets anywhere you like.

## Dependencies

* [POSIX] environment (Linux, BSD, etc.)
  [POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

## Installation

1.  Clone or [download] this Git repository onto your system.
[download]: https://github.com/sunaku/dasht/archive/master.zip

2.  Add the `bin/` folder to your `$PATH` environment variable:

        export PATH=$PATH:location_where_you_cloned_or_downloaded_dasht/bin

## Configuration

### `$DASHT_DOCSETS_DIR`

This environment variable specifies where your [Dash] docsets are installed.
If unspecified, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`, or
`$HOME/.local/share/dasht/docsets/` if `$XDG_DATA_HOME` is also unspecified.

## Usage

### dasht-query-html(1)

Decorates dasht-query-line(1) results as HTML table rows.

### dasht-query-line(1)

    Usage: dasht-query-line QUERY

Searches for the given QUERY within all available [Dash] docsets and
prints the results in groups of four lines, in the following order:

    name = VALUE    # value of the token that matched the QUERY
    type = VALUE    # type of the token, as defined in the docset
    from = VALUE    # name of the docset this result was found in
    url = VALUE     # URL of the API documentation for this result

Whitespace characters in the given QUERY are treated as wildcards.

## License

Distributed under the terms of the ISC license (see the LICENSE file).
