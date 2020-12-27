import strutils, sequtils

let
  seats_str = readFile("./input.txt").strip
  seats = seats_str.splitLines

func decode_bit(c: char): char =
  if c in {'F', 'L'}: return '0'
  if c in {'B', 'R'}: return '1'

proc decode_seat(str: string): int =
  let
    seat = str.mapIt(it.decode_bit)
    row = seat[0..6].join.parseBinInt
    col = seat[7..9].join.parseBinInt
  row * 8 + col

var maxSeatID = 0
for seat in seats:
  let id = decode_seat(seat)
  if id > maxSeatID:
    maxSeatID = id

echo "result: ", maxSeatID
