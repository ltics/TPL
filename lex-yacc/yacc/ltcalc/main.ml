(* file: main.ml *)
(* Assumes the parser file is "rpcalc.mly" and the lexer file is "lexer.mll". *)

(* 使用open_in是从文件中读取字符流 使用stdin是从标准输入输出中读取字符流 *)
(* lexbuf 和 Lexing.lexbuf 是一样一样的 *)

(* Called by the parser function on error override the parse_error func *)
let parse_error s =
  print_endline s;
  flush stdout

let main () =
  let cin =
    if Array.length Sys.argv > 1
    then open_in Sys.argv.(1)
    else stdin
  in
  try
    let lexbuf = Lexing.from_channel cin in
    while true do
      Ltcalc.input Lexer.token lexbuf
    done
  with End_of_file -> exit 0
        
let _ = Printexc.print main ()
