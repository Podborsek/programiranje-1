#2

def fiksna(sez):
    #Vrjetn bi se dal mal polepsat, ampak mislm da dela
    dolzina = len(sez)

    def pom(i):
        
        if dolzina <= i:
            return None
        else:
            tukaj = sez[i]

        if i == tukaj:
            return i
        elif tukaj <= 0:
            return pom(i+1)
        elif i < tukaj:
            return pom(tukaj)
        else:
            return pom(i+1)
    
    return pom(0)


#print(fiksna([-4, -2, 0, 2, 4]))


#4

def kup(x):

    # Funkcija vrne true, ce zmaga igralec A

    def pom(n,poteza):
        if n < 13:
            if n < 3:
                return not poteza
            else:
                return poteza
        else:
            for i in range(3,11):
                if pom(n-i, not poteza):
                    return True
            return not poteza
    
    return pom(x, True)
