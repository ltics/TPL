%{
  open Printf
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

%%
input: /* empty */ { }
     | input line { }
;
line: NEWLINE { }
     | exp NEWLINE { printf "\t%.10g\n" $1; flush stdout }
     | error NEWLINE { }
;
exp: NUM { $1 }
   | exp PLUS exp { $1 +. $3 }
   | exp MINUS exp { $1 -. $3 }
   | exp MULTIPLY exp { $1 *. $3 }
   | exp DIVIDE exp { $1 /. $3 }
   | MINUS exp %prec NEG { -. $2 }
   | exp CARET exp { $1 ** $3 }
   | LPAREN exp RPAREN { $2 }
;
%%
