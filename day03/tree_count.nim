import strutils, sequtils

const
  rowStep = 1
  colStep = 3

let
  area_str = readFile("./input.txt").strip
  area = area_str.splitLines
  rows = area.len
  cols = area[0].len

var
  matrix = newSeqWith(0, newSeq[int](0))
  trees = 0
  row = 1
  col = 1

proc toNum(c: char): int =
  if c == '.': return 0
  if c == '#': return 1
  return -1

proc getAt(row, col: int): int =
  matrix[row - 1][(col - 1).mod(cols)]

for line in area:
  matrix.add(line.mapIt(it.toNum))

while row <= rows:
  let cell = getAt(row, col)
  if cell == 1:
    trees += 1
  row += rowStep
  col += colStep

echo "result: ", trees
