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

[a-zA-Z][a-zA-Z0-9_]*   { return ID; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }

"="                         { return ASSIGN; }

"("         { return '('; }
")"         { return ')'; }

","                         { return ','; }
";"                         { return ';'; }

\n          { return EOL; }

[ \t]+      { /* ignora espaços */ }

.            { return ERROR; }

%%
