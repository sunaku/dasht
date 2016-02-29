# DASHT-DOCSETS-INSTALL 1       2016-02-28                            1.1.0

## NAME

dasht-docsets-install - installs new [Dash] docsets

## SYNOPSIS

`dasht-docsets-install` [*NAME*...]

### Examples

`dasht-docsets-install`
  Installs all new [Dash] docsets currently available.

`dasht-docsets-install` sh
  Installs new [Dash] docsets whose names contain "sh".

`dasht-docsets-install` sh 'c$'
  Installs new [Dash] docsets whose names contain "sh" or end in "c".

## DESCRIPTION

Installs new [Dash] docsets whose names match the *NAME* regex(7) patterns.
If no *NAME*s are given, all new docsets currently available are matched.
You are prompted to confirm this destructive operation for each match.

## ENVIRONMENT

`DASHT_DOCSETS_DIR`
  Defines the filesystem location where your [Dash] docsets are installed.
  If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`
  or, if `XDG_DATA_HOME` is undefined, `$HOME/.local/share/dasht/docsets/`.

## SEE ALSO

dasht-docsets-update(1), dasht-docsets-remove(1), dasht-docsets(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (see the LICENSE file).