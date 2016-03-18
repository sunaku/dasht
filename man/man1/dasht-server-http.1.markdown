# DASHT-SERVER-HTTP 1           2016-03-17                            2.0.0

## NAME

dasht-server-http - simple search engine that powers dasht-server(1)

## SYNOPSIS

`dasht-server-http`

### Examples

printf 'GET / HTTP/1.1\r\n' | `dasht-server-http`
  Shows topics (A-Z) from each installed [Dash] docset.

printf 'GET /?docsets=*DOCSETS* HTTP/1.1\r\n' | `dasht-server-http`
  Shows topics (A-Z) from installed [Dash] docsets matching *DOCSETS*.

printf 'GET /?query=*PATTERN* HTTP/1.1\r\n' | `dasht-server-http`
  Searches for *PATTERN* in all installed [Dash] docsets.

printf 'GET /?query=*PATTERN*&docsets=*DOCSETS* HTTP/1.1\r\n' | `dasht-server-http`
  Searches for *PATTERN* in installed [Dash] docsets matching *DOCSETS*.

## DESCRIPTION

Reads a single HTTP request from stdin and writes a HTTP response to stdout.
Any `query=`*PATTERN* and `docsets=`*DOCSETS* parameters in the request URL
are passed to dasht-query-html(1) as its *PATTERN* and *DOCSETS* arguments.

## ENVIRONMENT

`DASHT_DOCSETS_DIR`
  Defines the filesystem location where your [Dash] docsets are installed.
  If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`
  or, if `XDG_DATA_HOME` is undefined, `$HOME/.local/share/dasht/docsets/`.

## SEE ALSO

dasht-query-html(1), dasht-server(1), dasht-docsets(1), dasht(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (see the LICENSE file).