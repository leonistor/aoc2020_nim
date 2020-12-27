import sequtils, strutils

let expenses = readFile("./expenses.txt")
let values = expenses[0..^2].splitLines.mapIt(it.parseInt)

var f, b: int
for foo in values:
  for bar in values:
    if foo + bar == 2020:
      f = foo
      b = bar

echo "result: ", f * b
