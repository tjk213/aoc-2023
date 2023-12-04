
from pathlib import Path

def main():
  print("Advent of Code: Day 1")

  let filename = Path("input.txt")
  let x = filename.read_text().split('\n')

  var total: Int = 0
  for i in range(len(x)):
    N = len(x[i])
    var z: Int = 0
    for j in range(N):
      if isdigit(ord(x[i][j])):
        z = atol(x[i][j]) * 10
        break
    for j in range(N):
      if isdigit(ord(x[i][N-j-1])):
        z += atol(x[i][N-j-1])
        break

    total += z

  print('Total: ', total)
  return
        

              

  
