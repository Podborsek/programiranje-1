(* =================== *)
(* 1. naloga: funkcije *)
(* =================== *)

let is_root a b = if 0 <= a then if a * a = b then true else false else false


let pack3 a b c = (a,b,c)



let sum_if_not pogoj xs =
    let rec pomozna acc pogoj xs =
        match xs with
        | [] -> acc
        | x :: xs -> if pogoj x then pomozna acc pogoj xs else pomozna (acc + x) pogoj xs
    in pomozna 0 pogoj xs



let reverse xs =
  let rec reverse' acc xs =
    match xs with
      | [] -> acc
      | x :: xs -> reverse' (x :: acc) xs
  in reverse' [] xs


let apply fs xs =
    let rec fji_na_x fs x acc =
        match fs with
        | [] -> reverse acc
        | f :: fs -> fji_na_x fs x ((f x) :: acc)
    in
    let rec pomozna fs xs acc =
        match xs with
        | [] -> reverse acc
        | x :: xs -> pomozna fs xs ((fji_na_x fs x []) :: acc)
    in pomozna fs xs []



(* ======================================= *)
(* 2. naloga: podatkovni tipi in rekurzija *)
(* ======================================= *)

type vrsta_srecanja = Predavnaja | Vaje
type srecanje = {predmet: string; vrsta: vrsta_srecanja; trajanje: int}
type urnik = srecanje list list


let vaje = {predmet = "Analiza 2a"; vrsta = Vaje; trajanje = 3}
let predavanje = {predmet = "Programiranje 1"; vrsta = Predavnaja; trajanje = 2}
let urnik_profesor = [[{predmet = "Fizika"; vrsta = Vaje; trajanje = 2}];[];[{predmet = "Fizika"; vrsta = Predavnaja; trajanje = 1}];[];[];[{predmet = "Fizika"; vrsta = Vaje; trajanje = 1}]]



let v_dnevu dan =
    let rec pomozna acc dan =
        match dan with
        | [] -> acc
        | d :: dan -> if d.vrsta = Predavnaja then pomozna (2 * d.trajanje + acc) dan else pomozna (d.trajanje + acc) dan
    in pomozna 0 dan

let bogastvo ure =
    let rec pomozna acc ure =
        match ure with
        | [] -> acc
        | dan :: ure -> pomozna (v_dnevu dan + acc) ure
    in pomozna 0 ure





let sestej_dan dan =
    let rec pomozna p v dan =
        match dan with
        | [] -> (p,v)
        | d :: dan -> if d.vrsta = Predavnaja then pomozna (p + d.trajanje) v dan else pomozna p (v + d.trajanje) dan
    in pomozna 0 0 dan

let je_preobremenjen () = failwith "dopolni me" (* Zdaj bi podobno kot pri bogastvu sel cez seznam seznamov in sproti preverjal *)