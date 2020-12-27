import strutils, sequtils, sets

const
  mandatory = ["ecl", "pid", "eyr", "hcl",
               "byr", "iyr", "hgt"].toHashSet

let
  data_str = readFile("./input.txt").strip
  data = data_str.split("\n\n")

proc isValid(pass: string): bool =
  let elems = pass
    .split(" ")
    .mapIt(it.split(":"))
    .mapIt(it[0])
    .toHashSet
  # echo elems
  mandatory <= elems

var valids = 0
for chunk in data:
  let pass = chunk.replace("\n", " ")
  if isValid(pass):
    valids += 1

echo "result: ", valids
