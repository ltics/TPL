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

val input :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
