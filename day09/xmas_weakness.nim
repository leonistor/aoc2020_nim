import strutils, sequtils, math

let
  nums_str = readFile("./input.txt").strip
  # nums_str = readFile("./input_test.txt").strip
  nums = nums_str.splitLines.mapIt(it.parseInt)

  target: int = 1309761972
  # target: int = 127
  total = nums.high

var
  length = 2

while length < total + 1:
  # echo "length: ", length, " -".repeat(10)
  echo length, "  / ", (total + 1)
  for i in 0..total-length:
    # echo nums[i..i+length]
    let chunk = nums[i..i+length]
    if chunk.sum == target:
      echo "result: ", min(chunk) + max(chunk)
      quit(0)
  length += 1
