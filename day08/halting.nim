import strutils

let
  data_str = readFile("./input_test.txt").strip
  data = data_str.splitLines

type
  Instruction = tuple
    exec: string
    value: int
    visited: bool

var
  instructions: seq[Instruction]

for line in data:
  let
    parts = line.split(" ")
    exec = parts[0]
    value = parts[1].parseInt
  instructions.add((exec: exec, value: value, visited: false))

var
  acc = 0
  pos = 0
  exec: string
  value: int
  visited: bool

while true:
  (exec, value, visited) = instructions[pos]
  echo "pos: ", pos, " ", exec, " ", value, " ", visited
  if not visited:
    instructions[pos].visited = true
    case exec:
    of "jmp":
      pos += value
    of "acc":
      acc += value
      pos += 1
    of "nop":
      pos += 1
    else:
      break
  else:
    break

echo "result: ", acc
