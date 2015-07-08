type token =
  | NEWLINE
  | LPAREN
  | RPAREN
  | EQ
  | NUM of (float)
  | PLUS
  | MINUS
  | MULTIPLY
  | DIVIDE
  | CARET
  | VAR of (string)
  | FNCT of (float->float)

open Parsing;;
let _ = parse_error;;
# 2 "mfcalc.mly"
  open Printf
  open Lexing

  let create_hashtable size init =
    let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl

  let var_table = create_hashtable 16 [
    ("pi", 3.14159265);
    ("e", 2.71828182);
  ]  
# 31 "mfcalc.ml"
let yytransl_const = [|
  257 (* NEWLINE *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* EQ *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* MULTIPLY *);
  265 (* DIVIDE *);
  266 (* CARET *);
    0|]

let yytransl_block = [|
  261 (* NUM *);
  267 (* VAR *);
  268 (* FNCT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\002\000\001\000\001\000\003\000\
\004\000\003\000\003\000\003\000\003\000\002\000\003\000\003\000\
\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\003\000\000\000\006\000\000\000\
\000\000\000\000\002\000\000\000\005\000\000\000\000\000\000\000\
\000\000\004\000\000\000\000\000\000\000\000\000\000\000\016\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\009\000"

let yydgoto = "\002\000\
\003\000\011\000\012\000"

let yysindex = "\003\000\
\000\000\000\000\018\255\004\255\000\000\026\255\000\000\026\255\
\008\255\019\255\000\000\043\255\000\000\096\255\016\255\026\255\
\026\255\000\000\026\255\026\255\026\255\026\255\026\255\000\000\
\109\255\104\255\016\255\016\255\016\255\016\255\016\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\027\000\000\000\000\000\000\000\000\000\000\000\
\033\255\000\000\000\000\000\000\000\000\000\000\000\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\021\255\000\000\053\255\062\255\071\255\080\255\089\255\000\000"

let yygindex = "\000\000\
\000\000\000\000\250\255"

let yytablesize = 119
let yytable = "\014\000\
\014\000\015\000\014\000\001\000\013\000\014\000\014\000\014\000\
\014\000\025\000\026\000\016\000\027\000\028\000\029\000\030\000\
\031\000\004\000\005\000\006\000\017\000\008\000\007\000\008\000\
\008\000\023\000\017\000\006\000\009\000\010\000\007\000\000\000\
\008\000\007\000\000\000\007\000\009\000\010\000\007\000\007\000\
\007\000\007\000\007\000\018\000\000\000\000\000\000\000\000\000\
\019\000\020\000\021\000\022\000\023\000\010\000\000\000\010\000\
\000\000\000\000\010\000\010\000\010\000\010\000\011\000\000\000\
\011\000\000\000\000\000\011\000\011\000\011\000\011\000\012\000\
\000\000\012\000\000\000\000\000\012\000\012\000\012\000\012\000\
\013\000\000\000\013\000\000\000\000\000\013\000\013\000\013\000\
\013\000\015\000\000\000\015\000\000\000\000\000\015\000\015\000\
\015\000\015\000\024\000\000\000\000\000\019\000\020\000\021\000\
\022\000\023\000\032\000\000\000\000\000\019\000\020\000\021\000\
\022\000\023\000\019\000\020\000\021\000\022\000\023\000"

let yycheck = "\006\000\
\001\001\008\000\003\001\001\000\001\001\006\001\007\001\008\001\
\009\001\016\000\017\000\004\001\019\000\020\000\021\000\022\000\
\023\000\000\001\001\001\002\001\002\001\001\001\005\001\003\001\
\007\001\010\001\000\000\002\001\011\001\012\001\005\001\255\255\
\007\001\001\001\255\255\003\001\011\001\012\001\006\001\007\001\
\008\001\009\001\010\001\001\001\255\255\255\255\255\255\255\255\
\006\001\007\001\008\001\009\001\010\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\009\001\001\001\255\255\
\003\001\255\255\255\255\006\001\007\001\008\001\009\001\001\001\
\255\255\003\001\255\255\255\255\006\001\007\001\008\001\009\001\
\001\001\255\255\003\001\255\255\255\255\006\001\007\001\008\001\
\009\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\009\001\003\001\255\255\255\255\006\001\007\001\008\001\
\009\001\010\001\003\001\255\255\255\255\006\001\007\001\008\001\
\009\001\010\001\006\001\007\001\008\001\009\001\010\001"

let yynames_const = "\
  NEWLINE\000\
  LPAREN\000\
  RPAREN\000\
  EQ\000\
  PLUS\000\
  MINUS\000\
  MULTIPLY\000\
  DIVIDE\000\
  CARET\000\
  "

let yynames_block = "\
  NUM\000\
  VAR\000\
  FNCT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "mfcalc.mly"
                   ( )
# 143 "mfcalc.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 34 "mfcalc.mly"
                  ( )
# 151 "mfcalc.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "mfcalc.mly"
              ( )
# 157 "mfcalc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 37 "mfcalc.mly"
                   ( printf "\t%.10g\n" _1; flush stdout )
# 164 "mfcalc.ml"
               : 'line))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "mfcalc.mly"
                     ( )
# 170 "mfcalc.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 40 "mfcalc.mly"
         ( _1 )
# 177 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 42 "mfcalc.mly"
     (
       try Hashtbl.find var_table _1
       with Not_found ->
         printf "no such variable '%s'\n" _1;
         0.0
     )
# 189 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 49 "mfcalc.mly"
     (
       Hashtbl.replace var_table _1 _3;
       _3
     )
# 200 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : float->float) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 53 "mfcalc.mly"
                            ( _1 _3 )
# 208 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 54 "mfcalc.mly"
                  ( _1 +. _3 )
# 216 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 55 "mfcalc.mly"
                   ( _1 -. _3 )
# 224 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 56 "mfcalc.mly"
                      ( _1 *. _3 )
# 232 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 58 "mfcalc.mly"
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
# 250 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 70 "mfcalc.mly"
                         ( -. _2 )
# 257 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 71 "mfcalc.mly"
                   ( _1 ** _3 )
# 265 "mfcalc.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 72 "mfcalc.mly"
                       ( _2 )
# 272 "mfcalc.ml"
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
