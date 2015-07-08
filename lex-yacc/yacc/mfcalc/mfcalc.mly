%{
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
%}

%token NEWLINE
%token LPAREN RPAREN EQ
%token <float> NUM
%token PLUS MINUS MULTIPLY DIVIDE CARET
%token <string> VAR
%token <float->float> FNCT

%left PLUS MINUS
/* multiply and divide has a higher precedence than plus and minus */
left MULTIPLY DIVIDE
%left NEG
%right CARET

%start input
%type <unit> input

%%
input: /* empty */ { }
     | input line { }
;
line: NEWLINE { }
     | exp NEWLINE { printf "\t%.10g\n" $1; flush stdout }
     | error NEWLINE { }
;
exp: NUM { $1 }
   | VAR
     {
       try Hashtbl.find var_table $1
       with Not_found ->
         printf "no such variable '%s'\n" $1;
         0.0
     }
   | VAR EQ exp
     {
       Hashtbl.replace var_table $1 $3;
       $3
     }
   | FNCT LPAREN exp RPAREN { $1 $3 }
   | exp PLUS exp { $1 +. $3 }
   | exp MINUS exp { $1 -. $3 }
   | exp MULTIPLY exp { $1 *. $3 }
   | exp DIVIDE exp
     {
       if $3 <> 0.0 then $1 /. $3
       else (
         let start_pos = Parsing.rhs_start_pos 3 in
         let end_pos = Parsing.rhs_end_pos 3 in
         printf "line %d column %d ~ line %d column %d: division by zero"
           start_pos.pos_lnum (start_pos.pos_cnum - start_pos.pos_bol)
           end_pos.pos_lnum (end_pos.pos_cnum - end_pos.pos_bol);
         1.0
       )
     }
   /* NEG的优先级是远高于MINUS的 使用%prec 就可以让 MINUS exp 这种语法形式出现时 MINUS 拥有和 NEG 一样高的优先级了 */
   | MINUS exp %prec NEG { -. $2 }
   | exp CARET exp { $1 ** $3 }
   | LPAREN exp RPAREN { $2 }
;
%%
