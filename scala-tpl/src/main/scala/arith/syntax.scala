package arith

/**
 * Created by zjh on 16/1/19.
 */

sealed trait Term

case object TmTrue extends Term
case object TmFalse extends Term
case class TmIf(cond: Term, consequent: Term, alternative: Term) extends
case object TmZero extends Term
case class TmSucc(t: Term) extends Term
case class TmPred(t: Term) extends Term
case class TmIsZero(t: Term) extends Term

sealed trait Command
case class Eval(t: Term) extends Command
