###############################################################################
# Želimo definirati pivotiranje na mestu za tabelo [a]. Ker bi želeli
# pivotirati zgolj dele tabele, se omejimo na del tabele, ki se nahaja med
# indeksoma [start] in [end].
#
# Primer: za [start = 0] in [end = 8] tabelo
#
# [10, 4, 5, 15, 11, 2, 17, 0, 18]
#
# preuredimo v
#
# [0, 2, 5, 4, 10, 11, 17, 15, 18]
#
# (Možnih je več različnih rešitev, pomembno je, da je element 10 pivot.)
#
# Sestavi funkcijo [pivot(a, start, end)], ki preuredi tabelo [a] tako, da bo
# element [ a[start] ] postal pivot za del tabele med indeksoma [start] in
# [end]. Funkcija naj vrne indeks, na katerem je po preurejanju pristal pivot.
# Funkcija naj deluje v času O(n), kjer je n dolžina tabele [a].
#
# Primer:
#
#     >>> a = [10, 4, 5, 15, 11, 2, 17, 0, 18]
#     >>> pivot(a, 1, 7)
#     3
#     >>> a
#     [10, 2, 0, 4, 11, 15, 17, 5, 18]
###############################################################################
'''def pivot(a,start,end):
    piv = a[start]
    piv_ind = start
    li = start
    di = end
    for i in range(1, end-start):
        if piv <= a[start + i]:
            li += 1
        else:
            for j in range(li,di):
                if piv <= a[di - j]:
'''
def pivot(table, start, end):
    li = start # start + 0
    di = end # start + end
    pivot = table[start]

    while li < di:
        if table[li + 1] < pivot:
            li += 1
        elif table[di] >= pivot:
            di -= 1
        else:
            table[li + 1], table[di] = table[di], table[li + 1]
    
    table[start] = table[di]
    table[di] = pivot
    return di
    



a = [10, 4, 5, 15, 11, 2, 17, 0, 18]
print(pivot(a,1,7))
print(a)


###############################################################################
# V tabeli želimo poiskati vrednost k-tega elementa po velikosti.
#
# Primer: Če je
#
#     >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
#
# potem je tretji element po velikosti enak 5, ker so od njega manši elementi
#  2, 3 in 4. Pri tem štejemo indekse od 0 naprej, torej je "ničti" element 2.
#
# Sestavite funkcijo [kth_element(a, k)], ki v tabeli [a] poišče [k]-ti
# element po velikosti. Funkcija sme spremeniti tabelo [a]. Cilj naloge je, da
# jo rešite brez da v celoti uredite tabelo [a].
###############################################################################
'''
neki ne dela
def kth_element(a, k, start=0, end=None):
    if end is None:
        end = len(a) - 1

    x = pivot(a, 0, len(a) - 1)
    if x == k:
        return a[x]
    elif x > k:
        return kth_element(a, k, start, x)
    else:
        return kth_element(a, k - x, x, end )

a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
print(kth_element(a,3))
'''


###############################################################################
# Tabelo a želimo urediti z algoritmom hitrega urejanja (quicksort).
#
# Napišite funkcijo [quicksort(a)], ki uredi tabelo [a] s pomočjo pivotiranja.
# Poskrbi, da algoritem deluje 'na mestu', torej ne uporablja novih tabel.
#
# Namig: Definirajte pomožno funkcijo [quicksort_part(a, start, end)], ki
#        uredi zgolj del tabele [a].
#
#     >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
#     >>> quicksort(a)
#     [2, 3, 4, 5, 10, 11, 15, 17, 18]
###############################################################################
def quicksort(a, start=0, end=None):
    if end is None:
        end = len(a) - 1
    
    if start >= end:
        return
    else:
        x = pivot(a, start, end)
        quicksort(a, start, x-1)
        quicksort(a, x + 1, end)


###############################################################################
# Če imamo dve urejeni tabeli, potem urejeno združeno tabelo dobimo tako, da
# urejeni tabeli zlijemo. Pri zlivanju vsakič vzamemo manjšega od začetnih
# elementov obeh tabel. Zaradi učinkovitosti ne ustvarjamo nove tabele, ampak
# rezultat zapisujemo v že pripravljeno tabelo (ustrezne dolžine).
# 
# Funkcija naj deluje v času O(n), kjer je n dolžina tarčne tabele.
# 
# Sestavite funkcijo [zlij(target, begin, end, list_1, list_2)], ki v del 
# tabele [target] med start in end zlije tabeli [list_1] in [list_2]. V primeru, 
# da sta elementa v obeh tabelah enaka, naj bo prvi element iz prve tabele.
# 
# Primer:
#  
#     >>> list_1 = [1,3,5,7,10]
#     >>> list_2 = [1,2,3,4,5,6,7]
#     >>> target = [-1 for _ in range(len(list_1) + len(list_2))]
#     >>> zlij(target, 0, len(target), list_1, list_2)
#     >>> target
#     [1,1,2,3,3,4,5,5,6,7,7,10]
#
###############################################################################
def zlij(target,begin,end, l1, l2):
    i1, i2 = 0,0
    for i in range(begin, end):
        if i1 >= len(l1):
            target[i] = l2[i2]
            i2 += 1
        elif i2 >= len(l2):          
            target[i] = l1[i1]
            i1 += 1
        elif l1[i1] <= l2[i2]:
            target[i] = l1[i1]
            i1 += 1
        else:
            target[i] = l2[i2]
            i2 += 1
    return target

list_1 = [1,3,5,7,10]
list_2 = [1,2,3,4,5,6,7]
target = [-1 for _ in range(len(list_1) + len(list_2))]
zlij(target, 0, len(target), list_1, list_2)
print(target)
###############################################################################
# Tabelo želimo urediti z zlivanjem (merge sort). 
# Tabelo razdelimo na polovici, ju rekurzivno uredimo in nato zlijemo z uporabo
# funkcije [zlij].
#
# Namig: prazna tabela in tabela z enim samim elementom sta vedno urejeni.
#
# Napišite funkcijo [mergesort(a)], ki uredi tabelo [a] s pomočjo zlivanja.
# Za razliko od hitrega urejanja tu tabele lahko kopirate, zlivanje pa je 
# potrebno narediti na mestu.
#
# >>> a = [10, 4, 5, 15, 11, 3, 17, 2, 18]
# >>> mergesort(a)
# [2, 3, 4, 5, 10, 11, 15, 17, 18]
###############################################################################

a = [10, 4, 5, 15, 11, 3, 17, 2, 18] 

def mergesort(a):
    if len(a) <= 1:
        return a
    else:
        b = len(a) // 2
        return zlij(a, 0, len(a), mergesort(a[:b]), mergesort(a[b:]))

print(mergesort(a))


import random
r1 = [random.randint(0,100000) for i in range(50000)]
r2 = r1
quicksort(r1)
#print(r1)
mergesort(r2)
print(r1 == r2)