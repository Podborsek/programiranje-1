from functools import lru_cache
#@lru_cache(maxsize=None)

test1 = [2,4,1,2,1,3,1,1,5]
test2 = [4,1,8,2,11,1,1,1,1,1]


def najhitrejsa(sez):
    dolzina = len(sez)

    @lru_cache(maxsize=None)
    def f(energija, polje):
        if dolzina <= polje:
            return 0
        else:
            energija += sez[polje]
            mozne = []
            for i in range(energija):
                if dolzina <= (polje + (energija - i)):
                    return 1
                else:
                    mozne.append(f(i,polje + (energija - i)))
            return (1 + min(mozne))

    return f(0, 0)


print(najhitrejsa(test1))
print(najhitrejsa(test2))
print(najhitrejsa([(x + 2) for x in range(500)]))

