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
%token PRINT IFT CONCAT LENGTH
%token ASSIGN
%token EOL

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
: ID ASSIGN expr EOL
| PRINT '(' exprlist ')' EOL
| expr EOL
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
    | CONCAT '(' exprlist ')'  
    | '(' expr ')'
    | NUM
    | expr CONCAT expr                  
    | LENGTH '(' expr ')'        
    | ID                                
    | STRING                            
    | MINUS expr %prec UMINUS
    ;

%%
