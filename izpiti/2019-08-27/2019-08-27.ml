(* 1. *)

let odstej_trojici (x1,x2,x3) (y1,y2,y3) = (x1 - y1, x2 - y2, x3 - y3)
let max_rezultat_do_n n f =
    let rec pom i acc =
        if i = n + 1 then acc else
        if acc < (f i) then pom (i+1) (f i) else pom (i+1) acc
    in pom 1 (f 0)


let pocisti_seznam xs = 
    let rec pom xs acc =
        match xs with
        | [] -> List.rev acc
        | x :: xs' -> match x with
                        | Some(y) -> pom xs' (y :: acc)
                        | None -> pom xs' acc
    in pom xs []


let razdeli xs =
    let rec pom xs sodi lihi =
        match xs with
        | [] -> (List.rev sodi, List.rev lihi)
        | x :: xs' -> if x mod 2 = 0 then pom xs' (x :: sodi) lihi else pom xs' sodi (x :: lihi)
    in pom xs [] []

let urejen rel xs =
    if xs = [] then true else
    let rec pom acc xs =
        match xs with
        | [] -> true
        | x :: xs' -> if rel acc x then pom x xs' else false
    in pom (List.hd xs) (List.tl xs)

let preveri_urejenost sez =
    let (sodi,lihi) = razdeli sez in
    (urejen (<=) sodi) && (urejen (>=) lihi)




(* 2. *)
type 'a gnezdenje =
    | Element of 'a
    | Podseznam of 'a gnezdenje list 

let gn_primer = [Podseznam([Element(1); Element(2); Podseznam([Element(3); Podseznam([Element(4)]); Podseznam([])]); Podseznam([Element(5)])])]


let rec najvecja_globina = function
  | [] -> 1
  | Element _ :: xs -> najvecja_globina xs
  | Podseznam podsez :: xs ->
      max (najvecja_globina podsez + 1) (najvecja_globina xs)

let rec preslikaj f = function
  | [] -> []
  | Element x :: xs -> Element (f x) :: preslikaj f xs
  | Podseznam podsez :: xs -> Podseznam (preslikaj f podsez) :: preslikaj f xs