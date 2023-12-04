
from pathlib import Path
from python.python import Python

def check(b: Bool, err: StringLiteral):
    if not b:
        raise Error(err)
    
def main():

    let filename = Path("input.txt")
    let x = filename.read_text().split('\n')

    var total: Int = 0
    for i in range(len(x)):
        # Skip blank lines
        if x[i] == '':
            continue

        check(x[i][0:4] == "Game", "Bad input line?")

        # Get game ID
        var j: Int = 5
        var id_str: String = ""
        while isdigit(ord(x[i][j])):
            id_str += x[i][j]
            j += 1

        let id = atol(id_str)
        check(id == i+1, "Non-sequential ids?")
        check(x[i].count(':') == 1, "Multiple semicolons?")

        let draws = x[i].split(':')[1]
        let draw_list = draws.split(';')
        let n_draws = len(draw_list)
        var possible = True
        #print("n_draws =",n_draws)
        for j in range(n_draws):
            let colors = draw_list[j].split(',')
            let color2count = Python.dict()
            color2count['red'] = 0
            color2count['blue'] = 0
            color2count['green'] = 0
            for k in range(len(colors)):
                var numcolor_str = colors[k]
                if numcolor_str[0] == ' ':
                    numcolor_str = numcolor_str[1::]

                check(numcolor_str.count(' ') == 1, "Multiple spaces?")
                let numcolor = numcolor_str.split(' ')
                color2count[numcolor[1]] = atol(numcolor[0])

            #print(color2count['red'] > 12)
            #print(color2count['green'] > 13)
            #print(color2count['blue'] > 14)
            
            if color2count['red'] > 12 or \
               color2count['green'] > 13 or \
               color2count['blue'] > 14:
                possible = False
                break

        #print("Game #", id, ":", possible)
        if possible:
            total += id

    print('total: ', total)
    return

        
