# Advent of code 2019 - Haskell

An attempt to learn Haskell by solving AoC 2019.
https://adventofcode.com/2019

## Getting started

Install stack: https://docs.haskellstack.org/en/stable/README/

Run the individual day solutions using stack. The interpreter is specified in the hs files. For example

    stack runghc -- -isrc app/Day2.hs

If the Day doesn not use any methods defined in src/, you can simplify this command:

    stack app/Day1.hs
