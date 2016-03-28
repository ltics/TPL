(ns clojure-tpl.arith.parser-test
  (require [acolfut.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all]
           [clojure-tpl.arith.parser :refer :all]))

(deftest parser-test
  (is= (parse "/* a block comment */") [])
  (is= (parse "true;") [(Eval TmTrue)])
  (is= (parse "if false then true else false;")
       [(Eval (TmIf TmFalse TmTrue TmFalse))])
  (is= (parse "0;") [(Eval TmZero)])
  (is= (parse "succ (pred 0);")
       [(Eval (TmSucc (TmPred TmZero)))])
  (is= (parse "iszero (pred (succ (succ 0)));")
       [(Eval (TmIsZero (TmPred (TmSucc (TmSucc TmZero)))))]))
