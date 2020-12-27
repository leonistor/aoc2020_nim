import strutils, sequtils

const
  steps = # (colStep, rowStep)
    [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]

let
  area_str = readFile("./input.txt").strip
  area = area_str.splitLines
  rows = area.len
  cols = area[0].len

var
  matrix = newSeqWith(0, newSeq[int](0))
  trees_steps = newSeq[int](0)

proc toNum(c: char): int =
  if c == '.': return 0
  if c == '#': return 1
  return -1

proc getAt(row, col: int): int =
  matrix[row - 1][(col - 1).mod(cols)]

for line in area:
  matrix.add(line.mapIt(it.toNum))

for (colStep, rowStep) in steps:
  var
    row = 1
    col = 1
    trees = 0
  while row <= rows:
    let cell = getAt(row, col)
    if cell == 1:
      trees += 1
    row += rowStep
    col += colStep
  trees_steps.add(trees)

proc prod(xs: seq[int]): int =
  result = 1
  for x in xs:
    result *= x

echo "result: ", prod(trees_steps)
