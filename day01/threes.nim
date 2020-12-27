import sequtils, strutils

let expenses = readFile("./expenses.txt")
let values = expenses[0..^2].splitLines.mapIt(it.parseInt)

var f, b, z: int
for foo in values:
  for bar in values:
    for zet in values:
      if foo + bar + zet == 2020:
        f = foo
        b = bar
        z = zet

echo "result: ", f * b * z
