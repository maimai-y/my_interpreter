(* Value.t : プログラムの実行結果を表す型 *)
type t = VNumber of int

(* プログラムの実行結果を文字列にする関数 *)
(* Value.to_string : Value.t -> string *)
let to_string value = match value with
    VNumber (n) -> string_of_int n

(* プログラムの実行結果をプリントする関数 *)
(* Value.print : Value.t -> unit *)
let print exp =
  let str = to_string exp in
  print_string str
