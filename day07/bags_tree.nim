import strutils, tables

let
  data_str = readFile("./input.txt").strip
  data = data_str.splitLines

var
  rules = initTable[string, seq[(string, int)]]()
  values = initTable[string, int]()

for rule in data:
  let
    line = rule.split(" bags contain ")
    bag = line[0]
    content = line[1]
  discard rules.hasKeyOrPut(bag, @[])
  discard values.hasKeyOrPut(bag, -1)
  if content != "no other bags.":
    let elems = content.split(", ")
    for elem in elems:
      let
        spec = elem.split(" ")
        quantity = spec[0].parseInt
        other = spec[1] & " " & spec[2]
      rules[bag].add((other, quantity))

proc val(node: string): int =
  if values.hasKey(node) and values[node] != -1:
    return values[node]
  let
    children = rules[node]
  if children.len == 0:
    values[node] = 0
    return 0
  else:
    var ret = 0
    for (dst, qty) in children:
      let v = val(dst)
      if v == 0:
        ret += qty
      else:
        ret += qty * (v + 1)
    values[node] = ret
    return ret

let
  start_bag = "shiny gold"
var
  count = val(start_bag)
echo "result: ", count
