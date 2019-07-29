Custom Pandoc Dockerfile
========================

Custom pandoc image, containing:

-   Basic TexLive.
-   Pandoc Lua filters (<https://github.com/pandoc/lua-filters>).
-   `Python3` with `matplot` and `pygments`.
-   Source Code Pro Font (<https://github.com/adobe-fonts/source-code-pro>).
-   DejaVu Fonts (<https://github.com/dejavu-fonts/dejavu-fonts>).

This image based on Debian 10 and is using Pandoc 2.7.3-1.

Usage
=====

It's not defining entry point, so you should specify command by yourself.

For example:

``` sh
$ ls
test.md
$ docker run \
    -it \
    --rm \
    -v `pwd`:"/documents" \
    my-pandoc \
    pandoc -o test.pdf test.md
$ ls
test.md         test.pdf
```
