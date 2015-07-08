type token =
  | NEWLINE
  | LPAREN
  | RPAREN
  | NUM of (float)
  | PLUS
  | MINUS
  | MULTIPLY
  | DIVIDE
  | CARET

open Parsing;;
let _ = parse_error;;
# 2 "ltcalc.mly"
  open Printf
  open Lexing
# 18 "ltcalc.ml"
let yytransl_const = [|
  257 (* NEWLINE *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  261 (* PLUS *);
  262 (* MINUS *);
  263 (* MULTIPLY *);
  264 (* DIVIDE *);
  265 (* CARET *);
    0|]

let yytransl_block = [|
  260 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\001\000\003\000\003\000\003\000\
\003\000\002\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\003\000\000\000\005\000\000\000\002\000\
\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\
\000\000\012\000\000\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\003\000\008\000\009\000"

let yysindex = "\022\000\
\000\000\000\000\053\255\000\000\066\255\000\000\066\255\000\000\
\012\255\254\254\016\255\000\000\066\255\066\255\066\255\066\255\
\066\255\000\000\007\255\007\255\016\255\016\255\016\255"

let yyrindex = "\000\000\
\000\000\000\000\031\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\021\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\055\255\061\255\029\255\037\255\045\255"

let yygindex = "\000\000\
\000\000\000\000\251\255"

let yytablesize = 72
let yytable = "\010\000\
\018\000\011\000\013\000\014\000\015\000\016\000\017\000\019\000\
\020\000\021\000\022\000\023\000\012\000\015\000\016\000\017\000\
\013\000\014\000\015\000\016\000\017\000\010\000\001\000\010\000\
\017\000\010\000\010\000\010\000\010\000\008\000\013\000\008\000\
\000\000\008\000\008\000\008\000\008\000\009\000\000\000\009\000\
\000\000\009\000\009\000\009\000\009\000\011\000\000\000\011\000\
\000\000\011\000\011\000\011\000\011\000\004\000\005\000\006\000\
\006\000\006\000\007\000\006\000\006\000\007\000\000\000\007\000\
\000\000\007\000\007\000\005\000\000\000\006\000\000\000\007\000"

let yycheck = "\005\000\
\003\001\007\000\005\001\006\001\007\001\008\001\009\001\013\000\
\014\000\015\000\016\000\017\000\001\001\007\001\008\001\009\001\
\005\001\006\001\007\001\008\001\009\001\001\001\001\000\003\001\
\009\001\005\001\006\001\007\001\008\001\001\001\000\000\003\001\
\255\255\005\001\006\001\007\001\008\001\001\001\255\255\003\001\
\255\255\005\001\006\001\007\001\008\001\001\001\255\255\003\001\
\255\255\005\001\006\001\007\001\008\001\001\001\002\001\001\001\
\004\001\003\001\006\001\005\001\006\001\001\001\255\255\003\001\
\255\255\005\001\006\001\002\001\255\255\004\001\255\255\006\001"

let yynames_const = "\
  NEWLINE\000\
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  MULTIPLY\000\
  DIVIDE\000\
  CARET\000\
  "

let yynames_block = "\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 30 "ltcalc.mly"
                   ( )
# 107 "ltcalc.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 31 "ltcalc.mly"
                  ( )
# 115 "ltcalc.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "ltcalc.mly"
              ( )
# 121 "ltcalc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 34 "ltcalc.mly"
                   ( printf "\t%.10g\n" _1; flush stdout )
# 128 "ltcalc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 36 "ltcalc.mly"
         ( _1 )
# 135 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 37 "ltcalc.mly"
                  ( _1 +. _3 )
# 143 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 38 "ltcalc.mly"
                   ( _1 -. _3 )
# 151 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 39 "ltcalc.mly"
                      ( _1 *. _3 )
# 159 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 41 "ltcalc.mly"
     (
       if _3 <> 0.0 then _1 /. _3
       else (
         let start_pos = Parsing.rhs_start_pos 3 in
         let end_pos = Parsing.rhs_end_pos 3 in
         printf "line %d column %d ~ line %d column %d: division by zero"
           start_pos.pos_lnum (start_pos.pos_cnum - start_pos.pos_bol)
           end_pos.pos_lnum (end_pos.pos_cnum - end_pos.pos_bol);
         1.0
       )
     )
# 177 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 52 "ltcalc.mly"
                         ( -. _2 )
# 184 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 53 "ltcalc.mly"
                   ( _1 ** _3 )
# 192 "ltcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 54 "ltcalc.mly"
                       ( _2 )
# 199 "ltcalc.ml"
               : 'exp))
(* Entry input *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let input (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
;;
