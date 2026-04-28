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
%token PRINT CONCAT LENGHT
%token ASSIGN
%token EOL

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
: ID ASSIGN expr ';'
| PRINT '(' exprlist ')'
| expr ';'
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
    | CONCAT '(' expr ')'
    | LENGTH '(' expr ')'
    | '(' expr ')'
    | NUM         
    | ID                                
    | STRING                            
    | MINUS expr %prec UMINUS
    ;

%%
