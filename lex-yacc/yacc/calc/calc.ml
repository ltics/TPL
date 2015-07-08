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
# 2 "calc.mly"
  open Printf
# 17 "calc.ml"
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
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\002\000\001\000\003\000\003\000\
\003\000\003\000\002\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\003\000\000\000\006\000\000\000\
\002\000\000\000\005\000\000\000\000\000\004\000\000\000\000\000\
\000\000\000\000\000\000\013\000\000\000\000\000\000\000\000\000\
\000\000"

let yydgoto = "\002\000\
\003\000\009\000\010\000"

let yysindex = "\003\000\
\000\000\000\000\054\255\023\255\000\000\067\255\000\000\067\255\
\000\000\013\255\000\000\044\255\017\255\000\000\067\255\067\255\
\067\255\067\255\067\255\000\000\008\255\008\255\017\255\017\255\
\017\255"

let yyrindex = "\000\000\
\000\000\000\000\032\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\056\255\062\255\022\255\030\255\
\038\255"

let yygindex = "\000\000\
\000\000\000\000\250\255"

let yytablesize = 73
let yytable = "\012\000\
\011\000\013\000\011\000\001\000\011\000\011\000\011\000\011\000\
\021\000\022\000\023\000\024\000\025\000\014\000\017\000\018\000\
\019\000\015\000\016\000\017\000\018\000\019\000\009\000\011\000\
\009\000\019\000\009\000\009\000\009\000\009\000\010\000\014\000\
\010\000\000\000\010\000\010\000\010\000\010\000\012\000\000\000\
\012\000\000\000\012\000\012\000\012\000\012\000\020\000\000\000\
\015\000\016\000\017\000\018\000\019\000\004\000\005\000\006\000\
\007\000\007\000\007\000\008\000\007\000\007\000\008\000\000\000\
\008\000\000\000\008\000\008\000\006\000\000\000\007\000\000\000\
\008\000"

let yycheck = "\006\000\
\001\001\008\000\003\001\001\000\005\001\006\001\007\001\008\001\
\015\000\016\000\017\000\018\000\019\000\001\001\007\001\008\001\
\009\001\005\001\006\001\007\001\008\001\009\001\001\001\001\001\
\003\001\009\001\005\001\006\001\007\001\008\001\001\001\000\000\
\003\001\255\255\005\001\006\001\007\001\008\001\001\001\255\255\
\003\001\255\255\005\001\006\001\007\001\008\001\003\001\255\255\
\005\001\006\001\007\001\008\001\009\001\000\001\001\001\002\001\
\001\001\004\001\003\001\006\001\005\001\006\001\001\001\255\255\
\003\001\255\255\005\001\006\001\002\001\255\255\004\001\255\255\
\006\001"

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
# 19 "calc.mly"
                   ( )
# 111 "calc.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 20 "calc.mly"
                  ( )
# 119 "calc.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "calc.mly"
              ( )
# 125 "calc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 23 "calc.mly"
                   ( printf "\t%.10g\n" _1; flush stdout )
# 132 "calc.ml"
               : 'line))
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "calc.mly"
                     ( )
# 138 "calc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 26 "calc.mly"
         ( _1 )
# 145 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 27 "calc.mly"
                  ( _1 +. _3 )
# 153 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 28 "calc.mly"
                   ( _1 -. _3 )
# 161 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 29 "calc.mly"
                      ( _1 *. _3 )
# 169 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 30 "calc.mly"
                    ( _1 /. _3 )
# 177 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 31 "calc.mly"
                         ( -. _2 )
# 184 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 32 "calc.mly"
                   ( _1 ** _3 )
# 192 "calc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 33 "calc.mly"
                       ( _2 )
# 199 "calc.ml"
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
