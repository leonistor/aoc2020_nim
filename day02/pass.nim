import strutils, tables

let input = readFile("./input.txt")
let lines = input[0..^2].splitLines

var corrects = 0

for line in lines:
  let
    chunks = line.splitWhitespace()
    limits = chunks[0].split("-")
    lo = limits[0].parseInt
    hi = limits[1].parseInt
    letter = chunks[1][0]
    pass = chunks[2]
    freqs = pass.toCountTable
    count = freqs[letter]
  if count >= lo and count <= hi:
    corrects += 1

echo "corrects: ", corrects
