package arith

import scala.util.parsing.combinator.ImplicitConversions
import scala.util.parsing.combinator.syntactical.StandardTokenParsers

/**
 * Created by zjh on 16/1/20.
 */
object ArithParser extends StandardTokenParsers with ImplicitConversions {
    lexical.reserved += ("true", "false", "if", "then", "else", "iszero", "succ", "pred")
    lexical.delimiters += ("(", ")", ";")
}
