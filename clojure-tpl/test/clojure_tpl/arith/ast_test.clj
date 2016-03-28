(ns clojure-tpl.arith.ast-test
  (require [acolfut.sweet :refer :all]
           [clojure-tpl.arith.ast :refer :all]))

(deftest ast-test
  (testing "string of term"
    (let [term1 TmTrue
          term2 (TmIf TmFalse TmTrue TmFalse)
          term3 TmZero
          term4 (TmSucc (TmPred TmZero))
          term5 (TmIsZero (TmPred (TmSucc (TmSucc TmZero))))]
      (is= (string-of-term term1) "true")
      (is= (string-of-term term2) "if false then true else false")
      (is= (string-of-term term3) "0")
      (is= (string-of-term term4) "(succ pred 0)")
      (is= (string-of-term term5) "iszero pred (succ (succ 0))"))))

