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

val input :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
