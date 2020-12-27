import strutils, sequtils, algorithm

let
  nums_str = readFile("./input.txt").strip
  nums = nums_str.splitLines.mapIt(it.parseInt)

  preamble = 25
  total = nums.high

for i in preamble..total:
  let
    prevs = nums[i-preamble..i-1]
    curr = nums[i]
    sums = product([prevs, prevs]).mapIt(
      if it[0] != it[1]: it[0] + it[1] else: 0)
  echo i, " / ", total
  # echo sums, curr
  if not sums.contains(curr):
    echo "result: ", curr
    break
