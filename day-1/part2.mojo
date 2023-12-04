from pathlib import Path

def check_val(x: String, j: Int) -> Int:
    if isdigit(ord(x[j])):
        return atol(x[j])
    elif x[j:j+4] == "zero":
        return 0
    elif x[j:j+3] == "one":
        return 1
    elif x[j:j+3] == "two":
        return 2
    elif x[j:j+5] == "three":
        return 3
    elif x[j:j+4] == "four":
        return 4
    elif x[j:j+4] == "five":
        return 5
    elif x[j:j+3] == "six":
        return 6
    elif x[j:j+5] == "seven":
        return 7
    elif x[j:j+5] == "eight":
        return 8
    elif x[j:j+4] == "nine":
        return 9
    else:
        return -1
    

def main():
  print("Advent of Code: Day 1")

  let filename = Path("input.txt")
  let x = filename.read_text().split('\n')

  var total: Int = 0
  for i in range(len(x)):
    N = len(x[i])
    var ones: Int = 0
    var tens: Int = 0
    for j in range(N):
        tens = check_val(x[i], j)
        if tens != -1:
            break

    for j in range(N):
        ones = check_val(x[i], N-j-1)
        if ones != -1:
            break

    let z = tens*10 + ones
    #print(x[i], ': ', z)
    total += z

  print('Total: ', total)
  return

