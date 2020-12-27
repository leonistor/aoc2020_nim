import strutils, sequtils, sets, re

const
  mandatory = ["ecl", "pid", "eyr", "hcl",
               "byr", "iyr", "hgt"].toHashSet

let
  data_str = readFile("./input.txt").strip
  data = data_str.split("\n\n")

proc valid_year(value: string, lo, hi: int): bool =
  if not value.match(re"\d{4}"): return false
  let year = value.parseInt
  if year notin {lo..hi}: return false
  return true

proc valid_height(value: string): bool =
  if not value.match(re"^\d+(in|cm)$"): return false
  let
    unit = value[^2..^1]
    height = value[0..^3].parseInt
  if unit == "cm":
    return height in {150..193}
  if unit == "in":
    return height in {59..76}
  return false

proc valid_id(value: string): bool =
  value.len == 9 and value.allCharsInSet({'0'..'9'})

proc valid(field: string, value: string): bool =
  case field:
  of "byr":
    return valid_year(value, 1920, 2002)
  of "iyr":
    return valid_year(value, 2010, 2020)
  of "eyr":
    return valid_year(value, 2020, 2030)
  of "hgt":
    return valid_height(value)
  of "hcl":
    return value.match(re"#[0-9a-f]{6}")
  of "ecl":
    return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(value)
  of "pid":
    return valid_id(value)
  else: return true

proc passValid(pass: string): bool =
  let
    elems = pass
      .split(" ")
      .mapIt(it.split(":"))
    field_set = elems.mapIt(it[0]).toHashSet

  # structure
  if not (mandatory <= field_set):
    return false
  # fields
  for pair in elems:
    if not valid(pair[0], pair[1]):
      return false
  return true

var valids = 0
for chunk in data:
  let pass = chunk.replace("\n", " ")
  if passValid(pass):
    valids += 1
echo "result: ", valids
