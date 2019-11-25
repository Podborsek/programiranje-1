(* -------- 1 -------- *)
let reverse xs =
  let rec reverse' acc xs =
    match xs with
      | [] -> acc
      | x :: xs -> reverse' (x :: acc) xs
  in reverse' [] xs

let vsota xs =
  let rec pomozna acc xs =
    match xs with
      | [] -> acc
      | x :: xs -> pomozna (acc + x) xs
  in pomozna 0 xs

(* -------- 2 -------- *)
let rec je_narascujoc xs =
    match xs with
        | [] -> true
        | [x] -> true
        | x1 :: x2 :: xs -> if x1 <= x2 then je_narascujoc (x2 :: xs) else false

(* -------- 3 -------- *)
let vstavi n xs =
    let rec pomozna n acc xs =
        match xs with
        | [] -> reverse (n :: acc)
        | x :: xs -> if n <= x then ( reverse(acc) @ (n :: x :: xs) ) else pomozna n (x :: acc) xs
    in pomozna n [] xs

let uredi xs =
    let rec pomozna acc xs =
        match xs with
            | [] -> acc
            | x :: xs -> pomozna (vstavi x acc) xs
    in pomozna [] xs

(* -------- 4 -------- *)
let vstavi' cmp n xs =
    let rec pomozna cmp n acc xs =
        match xs with
        | [] -> reverse (n :: acc)
        | x :: xs -> if cmp n x then ( reverse(acc) @ (n :: x :: xs) ) else pomozna cmp n (x :: acc) xs
    in pomozna cmp n [] xs

let uredi' cmp xs =
    let rec pomozna cmp acc xs =
        match xs with
            | [] -> acc
            | x :: xs -> pomozna cmp (vstavi' cmp x acc) xs
    in pomozna cmp [] xs

(* -------- 5 -------- *)
type priority = Top| Group of int
type status =
    | Staff
    | Passenger of priority

type flyer = { status : status ; name : string }

let flyers = [ {status = Staff; name = "Quinn"}
             ; {status = Passenger (Group 0); name = "Xiao"}
             ; {status = Passenger Top; name = "Jaina"}
             ; {status = Passenger (Group 1000); name = "Aleks"}
             ; {status = Passenger (Group 1000); name = "Robin"}
             ; {status = Staff; name = "Alan"}
             ]


(* -------- 6 -------- *)
(*let red x' y' =  (*Testira ce ima x manjso prioriteto *)
    let x = x'.status in let y = y'.status in
    match (x,y) with
        | (_,Staff) -> true
        | (_,Passenger Top) -> true
        | (Passenger Group m, Passenger Group n) -> m <= n
*)
let red x' y' =  (*Testira ce ima x manjso prioriteto *)
    let x = x'.status in let y = y'.status in
    match (x,y) with
        | (Staff,Staff) -> true
        | (Staff, Passenger Top) -> false
        | (Passenger Top, Passenger Top) -> true
        | (Passenger Top, Staff) -> true
        | (Staff, Passenger Group _) -> false
        | (Passenger Top, Passenger Group _) -> false
        | (Passenger Group _, Staff) -> true
        | (Passenger Group _, Passenger Top) -> true
        | (Passenger Group m, Passenger Group n) -> m <= n

let red' x y = not (red x y)

let uredi_letalce xs =
    uredi' red' xs
(* -------- 7 -------- *)
let bloki potniki =
    let urejeni = uredi' red potniki in
    let rec pomozna vs ms sta xs =
    match xs with
        | [] -> ms :: vs
        | x :: xs -> if x.status = sta then pomozna vs (x :: ms) sta xs
        else pomozna (ms :: vs) [x] x.status xs
    in match urejeni with
        | x :: xs -> pomozna [] [x] x.status xs
        | [] -> []
