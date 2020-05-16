# DASHT-QUERY-LINE 1            2020-05-16                            2.4.0

## NAME

dasht-query-line - searches [Dash] docsets and emits groups of lines

## SYNOPSIS

`dasht-query-line` [*PATTERN*] [*DOCSET*]...

### Examples

`dasht-query-line`
  Topics (A-Z) from each installed docset.

`dasht-query-line` 'c - x'
  Search for "c - x" in all installed docsets.

`dasht-query-line` 'c - x' bash
  Search for "c - x" only in the "bash" docset.

`dasht-query-line` 'c - x' bash css
  Search for "c - x" only in the "bash" and "css" docsets.

## DESCRIPTION

Searches for *PATTERN* in all installed [Dash] docsets, optionally searching
only in those whose names match *DOCSET*s, by calling dasht-query-exec(1)
and emits the results in groups of lines, as described in "Results" below.
However, if no results were found, this program exits with a nonzero status.

### Searching

Whitespace characters in *PATTERN* are treated as wildcards, whereas the
SQL LIKE wildcard characters `%` and `_` are not: they are taken literally.

Before searching, *PATTERN* is surrounded by whitespace wildcards so that it
can match anywhere: beginning, middle, or end.  As a result, if *PATTERN* is
undefined, it becomes a whitespace wildcard and thereby matches everything.

### Results

Each search result is printed to stdout as a group of four lines of text:

`name` `=` *VALUE*
  Name of the token that matched the *PATTERN*.

`type` `=` *VALUE*
  Type of the token, as defined in the docset.

`from` `=` *VALUE*
  Name of the docset this result was found in.

`url` `=` *VALUE*
  URL of the API documentation for this result.

For example, here is a search result for "c - x" from the "bash" docset:

    name = undo (C-_ or C-x C-u)
    type = Function
    from = Bash
    url = file:///home/sunny/.local/share/dasht/docsets/Bash.docset/Contents/Resources/Documents/bash/Miscellaneous-Commands.html#//apple_ref/Function/undo%20%28C%2D%5F%20or%20C%2Dx%20C%2Du%29

## ENVIRONMENT

`DASHT_DOCSETS_DIR`
  Defines the filesystem location where your [Dash] docsets are installed.
  If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`
  or, if `XDG_DATA_HOME` is undefined, `$HOME/.local/share/dasht/docsets/`.

## EXIT STATUS

44
  No results were found.

## SEE ALSO

dasht-query-exec(1), dasht-query-html(1), dasht-docsets(1), dasht(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (see the LICENSE file).