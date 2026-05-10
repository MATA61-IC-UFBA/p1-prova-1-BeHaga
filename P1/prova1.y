%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token NUM PLUS MINUS TIMES DIV
<<<<<<< HEAD
%token IDENT STRING
%token PRINT CONCAT LENGTH
%token ASSIGN
%token EOL
%token LPAREN RPAREN
=======
%token ID STRING
%token PRINT IFT CONCAT LENGTH
%token ASSIGN
%token EOL
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)

%left PLUS MINUS
%left TIMES DIV
%left CONCAT
%right UMINUS

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
<<<<<<< HEAD
: IDENT ASSIGN expr ';'
| PRINT LPAREN exprlist RPAREN ';'
| expr ';'
=======
: ID ASSIGN expr EOL
| PRINT '(' exprlist ')' EOL
| expr EOL
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)
| EOL
;

exprlist
    : expr
    | exprlist ',' expr
    ;

expr
/* completar */
    : expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr
<<<<<<< HEAD
    | CONCAT LPAREN exprlist RPAREN
    | LENGTH LPAREN expr RPAREN
    | LPAREN expr RPAREN
    | NUM         
    | IDENT                                
=======
    | CONCAT '(' exprlist ')'  
    | '(' expr ')'
    | NUM
    | expr CONCAT expr                  
    | LENGTH '(' expr ')'        
    | ID                                
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)
    | STRING                            
    | MINUS expr %prec UMINUS
    ;

%%
