(* op_t : ２項演算子の型 *)
type op_t = Plus | Minus | Times | Equal | Less

(* ２項演算子を文字列にする関数 *)
(* op_to_string : op_t -> string *)
let op_to_string op = match op with
    Plus -> " + "
  | Minus -> " - "
  | Times -> " * "
  | Equal -> " = "
  | Less -> " < "

(* Syntax.t : プログラムを表す型 *)
type t = Number of int
       | Bool of bool
       | Var of string
       | Op of t * op_t * t
       | If of t * t * t
       | Let of t * t * t
       | Fun of string * t
       | App of t * t

(* プログラムを文字列にする関数 *)
(* Syntax.to_string : Syntax.t -> string *)
let rec to_string exp = match exp with
    Number (n) -> string_of_int n
  | Bool (b) -> if b then "true" else "false"
  | Var (var) -> var
  | Op (arg1, op, arg2) ->
      "(" ^ to_string arg1
          ^ op_to_string op
          ^ to_string arg2 ^ ")"
  | If (arg1, arg2, arg3) ->
      "(if " ^ to_string arg1
      ^ " then " ^ to_string arg2
      ^ " else " ^ to_string arg3 ^ ")"
  | Let (arg1, arg2, arg3) ->
      "(let " ^ to_string arg1
      ^ " = " ^ to_string arg2
      ^ " in " ^ to_string arg3 ^ ")"
  | Fun (arg1, arg2) ->
      "(fun " ^ arg1
      ^ " -> " ^ to_string arg2 ^ ")"
  | App (arg1, arg2) ->
      to_string arg1 ^ " " ^ to_string arg2 

(* プログラムをプリントする関数 *)
(* Syntax.print : Syntax.t -> unit *)
let print exp =
  let str = to_string exp in
  print_string str
