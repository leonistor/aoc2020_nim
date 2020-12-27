import strutils, sequtils

let
  data_str = readFile("./input.txt").strip
  data = data_str.splitLines

type
  Assembly = enum
    acc, jmp, nop, hlt
  Instruction = tuple
    exec: Assembly
    value: int

var
  instructions: seq[Instruction]

for line in data:
  let
    parts = line.split(" ")
    exec = parseEnum[Assembly](parts[0])
    value = parts[1].parseInt
  instructions.add((exec: exec, value: value))
# add last halt
instructions.add((exec: Assembly.hlt, value: 0))

proc print_instructions() =
  echo "-".repeat(20)
  echo instructions.mapIt($it[0] & " " & $it[1]).join("\n")

proc flip(instr: var Instruction) =
  case instr[0]:
  of jmp: instr[0] = nop
  of nop: instr[0] = jmp
  else: return

let total = instructions.len
# print_instructions()

for i, instr in instructions.mpairs:
  if instr[0] notin {jmp, nop}:
    continue
  else:
    flip(instructions[i])
    # print_instructions()

    # exec
    var
      accum = 0
      pos = 0
      exec: Assembly
      value: int
      visited = newSeq[bool](total)
      success = false
    while true:
      (exec, value) = instructions[pos]
      # echo "pos: ", pos, " ", exec, " ", value
      if not visited[pos]:
        visited[pos] = true
        case exec:
        of jmp:
          pos += value
        of acc:
          accum += value
          pos += 1
        of nop:
          pos += 1
        of hlt:
          success = true
          break
      else:
        break

    # flip back
    flip(instructions[i])

    echo i, " / ", total, " success: ", success, " result: ", accum
    if success: break
