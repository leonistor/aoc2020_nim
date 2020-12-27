import strutils

let input = readFile("./input.txt")
let lines = input[0..^2].splitLines

var corrects = 0

for line in lines:
  let
    chunks = line.splitWhitespace()
    limits = chunks[0].split("-")
    first = limits[0].parseInt - 1
    secnd = limits[1].parseInt - 1
    letter = chunks[1][0]
    pass = chunks[2]
    isFirst = pass[first] == letter
    isSecnd = pass[secnd] == letter
  if isFirst xor isSecnd:
    corrects += 1

echo "corrects: ", corrects
