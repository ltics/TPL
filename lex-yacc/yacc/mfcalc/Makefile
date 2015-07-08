all:
	ocamlyacc mfcalc.mly
	ocamlc -c mfcalc.mli
	ocamllex lexer.mll
	ocamlc -c lexer.ml
	ocamlc -c mfcalc.ml
	ocamlc -c main.ml
	ocamlc -o mfcalc lexer.cmo mfcalc.cmo main.cmo

repl:
	./mfcalc

test:
	./mfcalc test.mf
