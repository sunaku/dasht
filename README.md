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

First, install some [docsets]:

    dasht-docsets-install bash

Next, perform a direct search:

    dasht 'c - x'

Then, repeat in a web browser:

    dasht-server

Done! You are now ready to go.

### dasht(1)

Displays dasht-query-html(1) results, if any, using the w3m(1) browser.

### dasht-server(1)

    Usage: dasht-server [PORT]

Runs a local search engine on the given PORT at http://127.0.0.1:PORT
which is intended to be accessed by web browsers on the same machine.

If no PORT number is specified, then its value is assumed to be 54321.

The search engine's URL is printed to stdout for the user's reference.
You can use this to launch a web browser along with the search engine:

    dasht-server | xargs -n1 w3m

#### Browser refuses to load `file://` links

Some web browsers refuse to load `file://` links from `http://127.0.0.1` URLs.
However, the following web browsers do not suffer from this limitation and are
thereby recommended for use with the search engine powered by dasht-server(1).

Recommended terminal web browsers:

* [w3m]

* [elinks]
  [elinks]: http://elinks.or.cz

Recommended graphical web browsers:

* [Dillo]
  [Dillo]: http://www.dillo.org

* [NetSurf]
  [NetSurf]: http://www.netsurf-browser.org

* [Firefox] needs a workaround (see below)
  [Firefox]: http://www.mozilla.org/firefox

##### Firefox

The workaround for Firefox is to add this snippet to your `prefs.js` file:

    user_pref("capability.policy.policynames", "localfilelinks");
    user_pref("capability.policy.localfilelinks.sites", "http://127.0.0.1:54321");
    user_pref("capability.policy.localfilelinks.checkloaduri.enabled", "allAccess");

See <http://kb.mozillazine.org/Links_to_local_pages_do_not_work> for details.

### dasht-server-http(1)

Reads a single HTTP request from stdin and writes a response to stdout.

### dasht-query-html(1)

Decorates dasht-query-line(1) results as HTML table rows.

### dasht-query-line(1)

    Usage: dasht-query-line [PATTERN] [DOCSET...]

Searches for the given PATTERN in [Dash] docsets whose names loosely match the
given DOCSETs (or in all installed [Dash] docsets if no DOCSETs are specified)
and then prints the results in groups of four lines, in the following order:

    name = VALUE    # value of the token that matched the PATTERN
    type = VALUE    # type of the token, as defined in the docset
    from = VALUE    # name of the docset this result was found in
    url = VALUE     # URL of the API documentation for this result

Whitespace characters in the PATTERN are treated as wildcards, whereas the
SQL LIKE wildcard characters `%` and `_` are not: they are taken literally.

The given PATTERN is surrounded by whitespace wildcards before searching so
that it can match anywhere: beginning, middle, or end.  If unspecified, its
value is assumed to be a whitespace wildcard so that it matches everything.

### dasht-query-exec(1)

    Usage: dasht-query-exec PATTERN DATABASE [OPTIONS_FOR_SQLITE3...]

Searches for the given PATTERN in the given [Dash] docset DATABASE.

SQL LIKE wildcard characters in PATTERN are backslash escapable.
For example, `\%` and `\_` are escaped, but `%` and `_` are not.

Any specified OPTIONS\_FOR\_SQLITE3 are passed down to sqlite3(1).

### dasht-docsets(1)

    Usage: dasht-docsets [NAME...]

Lists the names of [Dash] docsets installed in `$DASHT_DOCSETS_DIR`.

If any NAMEs are specified, the list is filtered to include
only those docsets whose names loosely match the given NAMEs.

### dasht-docsets-install(1)

    Usage: dasht-docsets-install [NAME...]

Installs available [Dash] docsets whose names loosely match the given NAMEs.
You are asked to confirm this destructive operation for every such match.

If no NAMEs are specified, all available docsets are selected for install.

### dasht-docsets-update(1)

    Usage: dasht-docsets-update [NAME...]

Updates installed [Dash] docsets whose names loosely match the given NAMEs.

If no NAMEs are specified, all available docsets are selected for update.

### dasht-docsets-remove(1)

    Usage: dasht-docsets-remove [NAME...]

Removes installed [Dash] docsets whose names loosely match the given NAMEs.
You are asked to confirm this destructive operation for every such match.

If no NAMEs are specified, all installed docsets are selected for removal.

## License

Distributed under the terms of the ISC license (see the LICENSE file).
