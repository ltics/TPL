%{
  open Printf
  open Lexing
%}

%token NEWLINE
%token LPAREN RPAREN
%token <float> NUM
%token PLUS MINUS MULTIPLY DIVIDE CARET

%left PLUS MINUS
%left MULTIPLY DIVIDE
%left NEG
%right CARET

%start input
%type <unit> input

/*
A value of type position describes a point in a source file. pos_fname is the file name; pos_lnum is the line number; pos_bol is the offset of the beginning of the line (number of characters between the beginning of the lexbuf and the beginning of the line); pos_cnum is the offset of the position (number of characters between the beginning of the lexbuf and the position). The difference between pos_cnum and pos_bol is the character offset within the line (i.e. the column number, assuming each character is one column wide).
type Lexing.position = {
  pos_fname: string;
  pos_lnum: int;
  pos_bol: int;
  pos_cnum: int;
}
*/

%%
input: /* empty */ { }
     | input line { }
;
line: NEWLINE { }
     | exp NEWLINE { printf "\t%.10g\n" $1; flush stdout }
;
exp: NUM { $1 }
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
   | MINUS exp %prec NEG { -. $2 }
   | exp CARET exp { $1 ** $3 }
   | LPAREN exp RPAREN { $2 }
;
%%
