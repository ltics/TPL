(ns clojure-tpl.arith.eval-test
  (require [acolfut.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all]
           [clojure-tpl.arith.eval :refer :all])
  (:refer-clojure :exclude [eval]))

(deftest eval-test
  (let [term1 TmTrue
        term2 (TmIf TmFalse TmTrue TmFalse)
        term3 TmZero
        term4 (TmSucc (TmPred TmZero))
        term5 (TmIsZero (TmPred (TmSucc (TmSucc TmZero))))]
    (is= (eval term1) term1)
    (is= (eval term2) TmFalse)
    (is= (eval term3) term3)
    (is= (eval term4) (TmSucc TmZero))
    (is= (eval term5) TmFalse)))
