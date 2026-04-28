%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

/* copiar E2 e fazer as extensões */

"//".*                  { /* ignora comentários */ }

"print"     { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGHT; }

[0-9]+      { return NUM; }

\"[^\"\n]*\"     { return STRING; }

[a-zA-Z][a-zA-Z0-9_]*   { return IDENT; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }

"="         { return ASSIGN; }

"("         { return LPAREN; }
")"         { return RPAREN; }

","         { return ','; }
";"         { return ';'; }

\n          { return EOL; }

[ \t\r]+      { /* ignora espaços */ }

.            { return ERROR; }

%%
