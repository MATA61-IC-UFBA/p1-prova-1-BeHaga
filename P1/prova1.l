%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

"//".*                  { /* ignora comentários */ }

"print"     { return PRINT; }
"if"                    { return IFT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }

"//".*                  { /* ignora comentários */ }

"print"     { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGHT; }

[0-9]+      { return NUM; }

\"[^\"\n]*\"     { return STRING; }

<<<<<<< HEAD
[a-zA-Z][a-zA-Z0-9_]*   { return IDENT; }
=======
[a-zA-Z][a-zA-Z0-9_]*   { return ID; }
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }

<<<<<<< HEAD
"="         { return ASSIGN; }

"("         { return LPAREN; }
")"         { return RPAREN; }

","         { return ','; }
";"         { return ';'; }
=======
"="                         { return ASSIGN; }

"("         { return '('; }
")"         { return ')'; }
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)

","                         { return ','; }
";"                         { return ';'; }

\n          { return EOL; }

<<<<<<< HEAD
[ \t\r]+      { /* ignora espaços */ }
=======
[ \t]+      { /* ignora espaços */ }
>>>>>>> a062a5f (consertando LENGHT -> LENGTH)

.            { return ERROR; }

%%
