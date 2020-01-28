from functools import lru_cache

primer = [
    [(1,10), (3, -10)],      #0
    [(2,10), (5,-20)],       #1
    [(3,-10)],               #2
    [(4,15)],                #3
    [(5,0)]                  #4
]


def pobeg(zemljevid):
    #Upostevam: lokacijo, denar
    cilj = len(zemljevid)

    def pom(mesto, denar):
        if cilj <= mesto :
            if 0 <= denar:
                return [mesto]
            else:
                return None
        else:
            mozne = []
            for (dest, cena) in zemljevid[mesto]:
                beg = pom(dest, denar + cena)
                if beg is not None:
                    mozne.append(beg)
            if len(mozne) == 0:
                return None
            else:
                return [mesto] + sorted(mozne, key=len)[0]

    return pom(0,0)
            

'''
def najkrajsi(seznami):
    dolzina = min([len(x) for x in seznami])
    for sez in seznami:
        if dolzina == len(sez):
            return sez
'''        

print(pobeg(primer))