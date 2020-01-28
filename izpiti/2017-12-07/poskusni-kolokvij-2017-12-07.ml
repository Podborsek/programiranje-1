(* =================== *)
(* 1. naloga: funkcije *)
(* =================== *)

(* 1.1) Definirajte funkcijo, ki vzame dve celi števili ter vrne njuno vsoto.
   Primer: /sestej 2 3 = 5/ *)
let sestej = (+)

(* 1.2) Definirajte funkcijo, ki svojemu argumentu prišteje 3.
   Primer: /pristej_tri 10 = 13/ *)
let pristej_tri = (+) 3

(* 1.3) Definirajte funkcijo, ki vsem elementom seznama prišteje 5.
   Primer: /vsem_pristej_pet [1; 2] = [6; 7]/ *)
let vsem_pristej_pet = List.map ((+) 5)

(* 1.4) Definirajte funkcijo, ki vrne zadnjo komponento nabora s tremi elementi.
   Primer: /tretji (1, "horse", [None]) = [None]/ *)
let tretji (_,_,x) = x

(* 1.5) Definirajte funkcijo, ki vzame dve funkciji ter vrne njun kompozitum.
   Primer: /kompozitum succ string_of_int 5 = "6"/ *)
let kompozitum f g = (fun x -> g (f x))


(* ======================================= *)
(* 2. naloga: podatkovni tipi in rekurzija *)
(* ======================================= *)

(* 2.1) Rožno drevo je drevo, v katerem ima vsak koren poljubno mnogo otrok,
   ki so zopet rožna drevesa. Rožna drevesa predstavimo s parametričnim
   tipom /'a drevo/ z enim konstruktorjem, ki sprejme:
   - vrednost (koren) tipa /'a/ in
   - seznam (gozd) dreves tipa /'a drevo/. *)
type 'a drevo = Drevo of 'a * 'a drevo list

let t = Drevo(1,[])
let t' = Drevo(2,[t;t])
let t'' = Drevo(3,[Drevo(-1,[]); t'; Drevo(0,[])])

(* 2.2) Napišite funkcijo, ki vrne koren danega rožnega drevesa. *)
let koren = function
    | Drevo(x,_) -> x

(* 2.3) Napišite funkcijo, ki preveri, ali drevo celih števil vsebuje kakšno negativno število. *)
let rec zdruzi xs ys =
    match xs with
    | [] -> ys
    | x :: xs' -> zdruzi xs' (x :: ys)

let kaksno_negativno d =
    let rec pom = function
        | [] -> false
        | Drevo(x,ds) :: ost -> if x < 0 then true else pom (zdruzi ds ost)
    in match d with
        | Drevo(x,ds) -> if x < 0 then true else pom ds

(* 2.4) Sestavite funkcijo, ki sprejme naravno število ter sestavi (poljubno)
   drevo, ki ima toliko otrok.
   Namig: napišite pomožno funkcijo, ki ustvari poljuben seznam dane dolžine. *)
let drevo_z_veliko_otroci n =
    let rec pom n x =
        if n = 0 then [] else x :: pom (n-1) x
    in let sez = pom n (Drevo(n,[])) in Drevo(1,sez)

(* 2.5) Sestavite funkcijo, ki izračuna število vseh vozlišč v drevesu.
   Če želite vse točke, mora biti funkcija repno rekurzivna.

   Opomba: kot ste videli na vajah, nekatere funkcije iz modula List,
   na primer List.map, niso repno rekurzivne, zato se jim raje
   izognite. *)
let velikost = failwith "dopolni me"
