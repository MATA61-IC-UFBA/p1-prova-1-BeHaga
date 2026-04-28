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
%token IDENT STRING
%token PRINT CONCAT LENGTH
%token ASSIGN
%token EOL
%token LPAREN RPAREN

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
: IDENT ASSIGN expr ';'
| PRINT LPAREN exprlist RPAREN ';'
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
    | CONCAT LPAREN exprlist RPAREN
    | LENGTH LPAREN expr RPAREN
    | LPAREN expr RPAREN
    | NUM         
    | IDENT                                
    | STRING                            
    | MINUS expr %prec UMINUS
    ;

%%
