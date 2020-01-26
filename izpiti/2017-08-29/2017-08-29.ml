(* 1.*)
type matrika = Matrika of int list list

let x = Matrika([ [1;2] ; [3;4]])
let y = Matrika([ [1; 3]; [2; 4]])
let z = Matrika([ [0; 1]; [-2; 1]])

let sestej x y = y


(* 2. *)
type mnozica = Mnozica of int list

let presek_dveh a b =
    