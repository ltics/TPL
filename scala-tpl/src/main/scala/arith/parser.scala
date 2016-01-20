package arith

import scala.util.parsing.combinator.ImplicitConversions
import scala.util.parsing.combinator.syntactical.StandardTokenParsers

/**
 * Created by zjh on 16/1/20.
 */
object ArithParser extends StandardTokenParsers with ImplicitConversions {
    lexical.reserved +=("true", "false", "if", "then", "else", "iszero", "succ", "pred")
    lexical.delimiters +=("(", ")", ";")

    //一般按照precedence从低到高 从上往下 上面的是parse的入口
    private def topLevel: Parser[List[Command]] = {
        (command <~ ";") ~ topLevel ^^ { case c ~ cs => c :: cs } |
            success(List())
    }

    private def command: Parser[Command] = term ^^ Eval

    private def term: Parser[Term] = {
        //这种要^^多参函数的时候就需要隐式转换了
        appTerm |
            ("if" ~> term) ~ ("then" ~> term) ~ ("else" ~> term) ^^ TmIf
    }

    private def appTerm: Parser[Term] = {
        aTerm |
            "succ" ~> aTerm ^^ TmSucc |
            "pred" ~> aTerm ^^ TmPred |
            "iszero" ~> aTerm ^^ TmIsZero
    }

    private def aTerm: Parser[Term] = {
        "(" ~> term <~ ")" |
            "true" ^^ { _ => TmTrue } |
            "false" ^^ { _ => TmFalse } |
            numericLit ^^ { x => num(x.toInt) }
    }

    private def num(x: Int): Term = x match {
        case 0 => TmZero
        case _ => TmSucc(num(x - 1))
    }

    //private def eof: Parser[String] = elem("<eof>", _ == lexical.EOF) ^^ { _.chars }

    def parse(s: String) = phrase(topLevel)(new lexical.Scanner(s)) match {
        case t if t.successful => t.get
        case t                 => error(t.toString)
    }
}
