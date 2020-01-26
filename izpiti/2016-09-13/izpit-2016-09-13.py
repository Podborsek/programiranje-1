
def pisarji(k, sez):
    #Ker vsak prepisuje zaporedne to pomeni da moramo v seznam postaviti k - 1 preck, ki ga delijo
    dolzina = len(sez)


    def pom(pis, zac):
        if pis <= 1:
            return sum([sez[zac:]])
        else:
            mozne = []
            for i in range(zac + 1, dolzina - pis):
                mozne.append(max(sum(sez[zac:(i)]), pom(pis-1,i)))
            return min(mozne)
    
    return pom(k,0)

print(pisarji(3, [10, 20, 50, 130, 120, 70, 20]))