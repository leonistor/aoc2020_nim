import strutils, sequtils, algorithm, strformat, math

let
  adapters_str = readFile("./input_test.txt").strip
  adapters = adapters_str
    .splitLines
    .mapIt(it.parseInt)
    .sorted

var
  nexts = adapters
  diffs: seq[int]

nexts.insert(0, 0)
for (prev, next) in zip(nexts, adapters):
  diffs.add(next - prev)

# echo adapters
let
  d1 = diffs.countIt(it == 1)
  d3 = diffs.countIt(it == 3) + 1

echo "1: ", d1, ", 3: ", d3, ", prod: ", d1 * d3

# echo adapters
for i in 0..adapters.high:
  stdout.write &"{(adapters[i]):>2} "
stdout.write "\n"
# echo diffs
for i in 0..diffs.high:
  stdout.write &"{(diffs[i]):>2} "
stdout.write "\n"
echo sum(diffs)
