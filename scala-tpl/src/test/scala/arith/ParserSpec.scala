package arith

import org.scalatest._
import arith.ArithParser.parse

/**
 * Created by zjh on 16/1/20.
 */
class ParserSpec extends FlatSpec with Matchers {
    it should "parse input" in {
        parse("succ 7;") should be (List(Eval(TmSucc(TmSucc(TmSucc(TmSucc(TmSucc(TmSucc(TmSucc(TmSucc(TmZero)))))))))))
    }
}
