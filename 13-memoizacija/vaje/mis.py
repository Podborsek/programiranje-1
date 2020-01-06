from functools import lru_cache
import sys
sys.setrecursionlimit(10**9)

test_mat = [
    [1,2,0],
    [2,4,5],
    [7,0,1]
]

'''
def maks_neumn(matrika,i,j):
    #To mogoce ni cist prou, loh da je treba nekje i pa j zamenat
    visina = len(matrika) - i
    sirina = len(matrika[0]) - j

    if visina == 1:
        return sum(matrika[0])
    elif sirina == 1:
        rez = 0
        for i in range(visina):
            rez += matrika[i][0]
        return rez
    else:
        return matrika[i][j] + max(maks_neumn(matrika,i+1,j), maks_neumn(matrika,i,j+1))
        
print(maks_neumn(test_mat,0,0))
'''

def maks(matrika):
    if matrika == []:
        return 0
    
    max_row = len(matrika)
    max_col = len(matrika[0])

    @lru_cache(maxsize=None)
    def maksi(row,col):
        if row == max_row or col == max_col:
            return 0
        return matrika[row][col] + max(
            maksi(row + 1, col),
            maksi(row, col + 1)
        )
    
    return maksi(0,0)

print(maks(test_mat))
test2 = [[j for j in range(500)] for _ in range(500)]
print(maks(test2))