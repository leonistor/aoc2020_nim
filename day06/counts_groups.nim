import strutils, sequtils, sets

let
  data_str = readFile("./input.txt").strip
  data = data_str.split("\n\n")

var questions = 0
for group in data:
  let
    answers = group.splitLines.mapIt(it.toHashSet)
    common = answers.foldl(a * b)
  questions += common.len

echo "result: ", questions
