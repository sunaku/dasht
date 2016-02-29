# DASHT-SERVER 1                2016-02-28                            1.1.0

## NAME

dasht-server - runs a local search engine for your web browser

## SYNOPSIS

`dasht-server` [*PORT*]

### Examples

`dasht-server`
  Starts a local search engine at <http://127.0.0.1:54321>.

`dasht-server` 8080
  Starts a local search engine on port number 8080.

## DESCRIPTION

Runs a local search engine on *PORT* number, at <http://127.0.0.1:PORT>,
which can only be accessed by web browsers running on the local machine.
If no *PORT* number is specified, then its value is assumed to be 54321.

The search engine's URL is printed to stdout, for the user's reference,
which can be used to launch a web browser along with the search engine:

    dasht-server | xargs -n1 w3m

### Browser refuses to load `file://` links

Some browsers refuse to load `file://` links from `http://127.0.0.1` URLs.
However, the following browsers do not suffer from this limitation and are
thereby recommended for use with the search engine provided by this script.

Recommended terminal web browsers:

* [w3m]( http://w3m.sourceforge.net )

* [elinks]( http://elinks.or.cz )

* [lynx]( http://lynx.invisible-island.net )

Recommended graphical web browsers:

* [Dillo]( http://www.dillo.org )

* [NetSurf]( http://www.netsurf-browser.org )

* [Firefox]( http://www.mozilla.org/firefox ) needs a workaround (see below)

#### Firefox

The workaround for Firefox is to add this snippet to your `prefs.js` file:

    user_pref("capability.policy.policynames", "localfilelinks");
    user_pref("capability.policy.localfilelinks.sites", "http://127.0.0.1:54321");
    user_pref("capability.policy.localfilelinks.checkloaduri.enabled", "allAccess");

See http://kb.mozillazine.org/Links_to_local_pages_do_not_work for details.

## ENVIRONMENT

`DASHT_DOCSETS_DIR`
  Defines the filesystem location where your [Dash] docsets are installed.
  If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`
  or, if `XDG_DATA_HOME` is undefined, `$HOME/.local/share/dasht/docsets/`.

## SEE ALSO

socat(1), dasht-server-http(1), dasht-docsets(1), dasht(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (see the LICENSE file).