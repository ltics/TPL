grammar arith;

file: top? EOF;

top:  term SEMI?
    | term SEMI top
    ;

term: atom
    | LPAREN term RPAREN
    | SUCC term
    | PRED term
    | ISZERO term
    | IF term THEN term ELSE term
    ;

atom: true
    | false
    | int
    ;

true: TRUE;
false: FALSE;
int: INT;

IF: 'if';
THEN: 'then';
ELSE: 'else';
SUCC: 'succ';
PRED: 'pred';
ISZERO: 'iszero';

SEMI: ';';

TRUE: 'true';
FALSE: 'false';

BOOLT: 'bool';
INTT: 'int';

INT: '-'? [0-9]+;
LPAREN: '(';
RPAREN: ')';

WS: ('\t' | ' ' | '\r' | '\n'| '\u000C')+ -> skip;
LINE_COMMENT: '//' ~[\r\n]* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;
