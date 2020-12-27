import strutils, sequtils
import dijkstra

let
  data_str = readFile("./input.txt").strip
  data = data_str.splitLines

var
  bags: seq[string]
  edges: seq[(string, string, int)]

for rule in data:
  let
    line = rule.split(" bags contain ")
    bag = line[0]
    content = line[1]
  if content != "no other bags.":
    bags.add(bag)
    let elems = content.split(", ")
    for elem in elems:
      let
        spec = elem.split(" ")
        quantity = spec[0].parseInt
        other = spec[1] & " " & spec[2]
      edges.add((bag, other, quantity))

# echo edges
let
  target_bag = "shiny gold"
  graph = initGraph(edges)

var
  count = 0

for bag in bags:
  let path = graph.dijkstraPath(bag, target_bag)
  if path.len > 0:
    # echo bag, ": ", path
    count += 1
  # else:
  #   echo bag, ": no path!"

echo "result: ", count
