# DASHT-QUERY-EXEC 1            2020-05-16                            2.4.0

## NAME

dasht-query-exec - searches a [Dash] docset's SQLite3 database file

## SYNOPSIS

`dasht-query-exec` *PATTERN* *DATABASE* [*OPTIONS\_FOR\_SQLITE3*...]

## DESCRIPTION

Searches for *PATTERN* in *DATABASE*, which is an SQLite3 database file
located inside a [Dash] docset at `/Contents/Resources/docSet.dsidx`, while
passing the optional *OPTIONS\_FOR\_SQLITE3* arguments down to sqlite3(1).

If *PATTERN* is empty or solely consists of unescaped wildcard characters,
topics having distinct leading characters are returned from the *DATABASE*.

### Searching

SQL LIKE wildcard characters in *PATTERN* can be escaped with a backslash.
For example, `\%` and `\_` are escaped, whereas `%` and `_` are not escaped.

## SEE ALSO

sqlite3(1), dasht-query-line(1), dasht(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (refer to README file).