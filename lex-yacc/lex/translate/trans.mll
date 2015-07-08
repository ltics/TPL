{ }

rule translate = parse
  | "current_directory"
    {
      print_string (Sys.getcwd ());
      translate lexbuf
    }
  | _ as c
    {
      print_char c;
      translate lexbuf
    }
  | eof { exit 0 }

{
  let main () =
    let cin =
      if Array.length Sys.argv > 1
      then open_in Sys.argv.(1)
      else stdin
    in
    let lexbuf = Lexing.from_channel cin in
    translate lexbuf

  let _ = Printexc.print main ()
}
