%{

import java.io.*;

%}

/* YACC Declarations */
$token EOF
$token error
$token VOID
$token WHILE
$token EXTENDS
$token FOR
$token CLASS
$token NEW
$token RETURN
$token STATIC
$token THIS
$token IF
$token CHAR
$token INT
$token ASSIGN
$token SEMI
$token OR
$token COMMA
$token EQ
$token DOT
$token BOOL
$token LEQ
$token PLUS
$token GT
$token TIMES
$token RBRACE
$token LBRACKET
$token NEQ
$token LPAREN
$token AND
$token DIV
$token INT
$token MINUS
$token RBRACKET
$token LBRACE
$token IDENT
$token LT
$token RPAREN
$token GEQ
$token MOD


/* Grammar follows */
%%

/*Program consists of any amount of classes*/
Program
    : { }
    | Program Class {}
    ;

/*Class declaration */
Class
    : CLASS CName CParent LBRACE CBody RBRACE { }
    ;

CParent
    : {}
    | EXTENDS CName {}
    ;

CName
    : IDENTIFIER {}
    ;

CBody
    : {}
    | CBody CElement {}
    ;

CElement
    : Variable
    | Constructor
    | Method
    ;

Constructor
    : THIS MethodParams LBRACE Block RBRACE {}
    ;

/*Method can return either void or some type, which is defined by a class*/
Method
    : VOID IDENTIFIER Params  LBRACE Block RBRACE {}
    | CName IDENTIFIER Params LBRACE Block RBRACE {}
    ;


Params
    : {}
    | LPAREN ParamsList RPAREN {}
    ;

ParamList
    : Parameter {}
    | ParamList COMMA Parameter }
    ;

Parameter
    : CName IDENTIFIER  { }
    ;

If
    : IF LPAREN Expression RPAREN LBRACE  Block RBRACE {  }
    ;

Block
    : { }
    | Block Statement { }
    ;

Statement
    : If
    | While
    | Return
    | Variable
    | Assignment
    ;

While
    : WHILE LPAREN Expression RPAREN LBRACE Block RBRACE {  }
    ;

Return
    : RETURN SEMI{ }
    | RETURN Expression SEMI{}
    ;

Variable
    : CName  IDENTIFIER  ASSIGN Expression SEMI{  }
    ;

Assignment
    : IDENTIFIER ASSIGN Expression SEMI{  }
    ;

Expression
    : Primary
    | ConstructorCall
    | Expression DOT Call {  }
    ;

Primary
    : Literal
    | THIS
    | IDENTIFIER
    ;

ConstructorCall
    : CName LPAREN RPAREN {  }
    | CName LPAREN CallArgs RPAREN { }
    ;


Literal
    : BOOL
    | INT
    | CHAR
    ;

Call
    : IDENTIFIER {  }
    | IDENTIFIER LPAREN CallArgs RPAREN {  }
    ;

CallArgs
    : Expression {  }
    | CallArgs COMMA Expression {  }
    ;


%%