(*Prepisno lepo potenciranje *)
let rec dekomp n xs =
    if n = 1 then xs else
    if n mod 2 = 0 then dekomp (n / 2) (2::xs)
    else dekomp (n-1) (1::xs)

let eksponent x p =
    if p = 0 then 1 else
        let ps = dekomp p [] in
        let rec pom org cur ps =
            match ps with
            | [] -> cur
            | p :: ps' -> if p = 2 then pom org (cur * cur) ps' else pom org (org * cur) ps'
        in pom x x ps

(*Konec prepisa *)