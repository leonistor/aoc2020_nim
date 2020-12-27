import strutils, sets

let
  data_str = readFile("./input.txt").strip
  data = data_str.split("\n\n")

var questions = 0
for d in data:
  let group = d.replace("\n", "")
  questions += group.toHashSet.len

echo "result: ", questions
