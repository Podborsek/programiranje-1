from functools import lru_cache


@lru_cache(maxsize=None)
#Ne stekam naloge
def stolpi(n):
    if n <= 1:
        return 1
    elif n == 2:
        return 2
    elif n == 3:
        return 4
    else:
        return stolpi(n-1) + stolpi(n-2) + stolpi(n-3)


def st_stolpov(n):
    if n == 0:
        return 1
    ena = [0 for i in range(max(n + 1, 4))]
    dva = [0 for i in range(max(n + 1, 4))]
    tri = [0 for i in range(max(n + 1, 4))]
    ena[1] = ena[3] = dva[2] = dva[3] = tri[3] = 1
    for i in range(4, n + 1):
        ena[i] = dva[i - 1] + tri[i - 1]
        dva[i] = ena[i - 2] + tri[i - 2]
        tri[i] = ena[i - 3] + dva[i - 3]
    return ena[n] + dva[n] + tri[n]