from functools import lru_cache

primer = [
    [(1,10), (3, -10)],      #0
    [(2,10), (5,-20)],       #1
    [(3,-10)],               #2
    [(4,15)],                #3
    [(5,0)]                  #4
]


def pobeg(mesta):
    #Upostevam: lokacijo, denar
    dolzina = len(mesta)

    def f(lok, denar):
        if lok > dolzina and denar >= 0:
            return [lok]
        elif lok > dolzina:
            return None
        else:
            mozne = []
            for (cilj, cena) in mesta[lok]:
                
