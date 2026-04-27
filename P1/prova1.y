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
%token ID STRING
%token PRINT IFT CONCAT LENGHT
%token ASSIGN
%token EOL
%token IDENT
%token LPAREN RPAREN

%left CONCAT
%left PLUS MINUS
%left TIMES DIV
%left UMINUS

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
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
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
    | LPAREN expr RPAREN
    | '(' expr ')'
    | NUM
    | expr CONCAT expr                  
    | LENGHT LPAREN expr RPAREN          
    | ID                                
    | STRING                            
    | MINUS expr %prec UMINUS
    ;

%%