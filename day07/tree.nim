import strutils

type
  Node* {.acyclic.} = ref object
    value: int
    children*: seq[Node]

proc newNode*(value = 0): Node =
  Node(value: value, children: @[])

proc print*(node: Node, indent = 0) =
  stdout.write " ".repeat(indent), node.value, "\n"
  if node.children.len > 0:
    for c in node.children:
      print(c, indent + 1)
