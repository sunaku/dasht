# DASHT-DOCSETS-EXTRACT 1       2016-05-28                            2.1.0

## NAME

dasht-docsets-extract - extracts [Dash] docset archives (`*.tgz` files)

## SYNOPSIS

`dasht-docsets-extract` *FILE*...

### Examples

`dasht-docsets-extract` NET\_Framework.tgz
  Extracts the [Dash] docset archive file named "NET\_Framework.tgz" that is
  located in the current working directory.

`dasht-docsets-extract` NET\_Framework.tgz Font\_Awesome.tgz
  Extracts the [Dash] docset archive files named "NET\_Framework.tgz" and
  "Font\_Awesome.tgz" that are located in the current working directory.

`dasht-docsets-extract` ../some\_path\_here/NET\_Framework.tgz
  Extracts the [Dash] docset archive file named "NET\_Framework.tgz" that is
  located in a subdirectory one level above the current working directory.

## DESCRIPTION

Extracts the given [Dash] docset archive *FILE*s (`*.tgz` files) into the
location specified by the `DASHT_DOCSETS_DIR` environment variable and then
renames their extracted directories to match their rootnames (sans `.tgz`).

If an extracted directory already exists, its contents are updated in place.

## ENVIRONMENT

`DASHT_DOCSETS_DIR`
  Defines the filesystem location where your [Dash] docsets are installed.
  If undefined, its value is assumed to be `$XDG_DATA_HOME/dasht/docsets/`
  or, if `XDG_DATA_HOME` is undefined, `$HOME/.local/share/dasht/docsets/`.

## SEE ALSO

dasht-docsets-install(1), dasht-docsets-update(1), [Dash]

[Dash]: https://kapeli.com/dash

## AUTHOR

Written in 2016 by Suraj N. Kurapati <https://github.com/sunaku/dasht>
Distributed under the terms of the ISC license (see the LICENSE file).