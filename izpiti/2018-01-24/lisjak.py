from functools import lru_cache
import random
#Dela dobr


test = [
    [2,4,1,1],
    [3,2,0,5],
    [8,0,7,2]
]

def lisjak(n,sadovnjak):
    visina = len(sadovnjak) - 1
    dolzina = len(sadovnjak[0]) - 1


    @lru_cache(maxsize=None)
    def f(n,y,x):
        vrednost = sadovnjak[y][x]
        if n == 0 or (y == visina and x == dolzina):
            return 0
        elif x == dolzina:
            return vrednost + f((n-1),y+1,0)
        elif y == visina:
            return vrednost + f((n-1), y, x + 1)
        else:
            return vrednost + max( f((n-1), y, x + 1), f((n-1), y + 1, 0))

    return f(n,0,0)


print(lisjak(6,test))

test2 = [[random.randint(0,10000) for x in range(30)] for y in range(30)]
print(lisjak(400,test2))