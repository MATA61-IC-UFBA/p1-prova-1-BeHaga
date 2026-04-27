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

[0-9]+      { return NUM; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIV; }

"("         { return '('; }
")"         { return ')'; }

\n          { return EOL; }

[ \t]+      { /* ignora espaços */ }

"print"     { return PRINTT; }
"if"                    { return IFT; }
[a-zA-Z][a-zA-Z0-9_]*   { return ID; }
"concat"        { return CONCAT; }
"length"        { return LENGHT; }
"[^\"\n]*\"     { yylval.sval = strdup(yytext); return STRING; }
"="                         { return ASSIGN; }
"//".*                  { /* ignora comentários */ }
","                         { return ','; }
";"                         { return ';'; }
\n                          { return EOL; }
[ \t]+                      { /* ignora espaços */ }

.            { return ERROR; }

%%
