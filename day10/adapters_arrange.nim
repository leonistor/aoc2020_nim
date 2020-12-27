import strutils, sequtils, algorithm, strformat, math

let
  adapters_str = readFile("./input_test.txt").strip
var
  adapters = adapters_str
    .splitLines
    .mapIt(it.parseInt)
    .sorted
adapters.insert(0, 0)

let
  total = adapters.len
  last = adapters.high
var
  m = newSeqWith(total, newSeq[int](total))

for i in 0..last:
  for j in 1..3:
    if i + j <= last:
      let dist = adapters[i+j] - adapters[i]
      if dist in {1, 2, 3}: m[i][i+j] = dist

proc print_m() =
  stdout.write "   "
  # for i in 0..adapters.high:
  #   stdout.write &"{(adapters[i]):>2} "
  # stdout.write "\n"
  for i in 0..last:
    stdout.write &"{i:>2} "
  stdout.write "\n"
  for i, row in m:
    # stdout.write &"{(adapters[i]):>2} "
    stdout.write &"{i:>2} "
    for j, elem in row:
      if i == j:
        stdout.write " _ "
      else:
        stdout.write &"{elem:>2} "
    stdout.write "\n"


stdout.write "   "
for i in 0..adapters.high:
  stdout.write &"{(adapters[i]):>2} "
stdout.write "\n"

print_m()
echo ""

echo """
(0), 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19, (22)
(0), 1, 4, 5, 6, 7, 10, 12, 15, 16, 19, (22)
(0), 1, 4, 5, 7, 10, 11, 12, 15, 16, 19, (22)
(0), 1, 4, 5, 7, 10, 12, 15, 16, 19, (22)
(0), 1, 4, 6, 7, 10, 11, 12, 15, 16, 19, (22)
(0), 1, 4, 6, 7, 10, 12, 15, 16, 19, (22)
(0), 1, 4, 7, 10, 11, 12, 15, 16, 19, (22)
(0), 1, 4, 7, 10, 12, 15, 16, 19, (22)
"""
