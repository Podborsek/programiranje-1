from functools import lru_cache
#@lru_cache(maxsize=None)
test = [1,3,4,7,10]


def f(nosilnost, sez):
    #Mislm da dela
    if nosilnost == 0:
        return 1
    else:
        nacini = 0
        for i in range(len(sez)):
            teza = sez[i]
            if nosilnost - teza == 0:
                nacini += 1
                #break
            elif nosilnost - teza > 0:
                nacini += f(nosilnost - teza, sez[i:])
        return nacini



def ladje(nosilnost, zabojniki):
    #Ne dela
    dolzina = len(zabojniki)


    def pom(obremenitev, j):
        if obremenitev == nosilnost:
            return 1
        else:
            nacini = 0
            for i in range(j,dolzina):
                teza = zabojniki[i]
                if obremenitev + teza == nosilnost:
                    nacini += 1
                elif obremenitev + teza < nosilnost:
                    nacini += pom(obremenitev + teza, j + i)
            return nacini
    
    return pom(0,0)