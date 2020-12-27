# Advent of Code 2020

My solution in [nim](https://nim-lang.org/)

## clean (delete) nim binaries

[Find](https://github.com/sharkdp/fd) file names ending with __.nim__, remove extension and delete:

`fd -e nim | sed 's/\.nim$//' | xargs rm`
