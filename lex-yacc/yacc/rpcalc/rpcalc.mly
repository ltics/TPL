%{
  open Printf
%}

%token <float> NUM
%token PLUS MINUS MULTIPLY DIVIDE CARET UMINUS
%token NEWLINE

%start input
%type <unit> input

%%
input: /* empty */ { }
    | input line { }
;
line: NEWLINE { }
    | exp NEWLINE { printf "\t%.10g\n" $1; flush stdout } /* 一个exp加上一个换行符就是结束一个表达式的求值 需要把求值的结果打印出来 */
;
exp: NUM { $1 }
   | exp exp PLUS { $1 +. $2 }
   | exp exp MINUS { $1 -. $2 }
   | exp exp MULTIPLY { $1 *. $2 }
   | exp exp DIVIDE { $1 /. $2 }
   | exp exp CARET { $1 ** $2 }
   | exp UMINUS { -. $1 }
%%
