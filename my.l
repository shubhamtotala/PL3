%{

#include <stdio.h>
#include "y.tab.h" /*to use declared variables in yacc program*/
extern int scanner;
%}


%option yywrap  
NUMBER      [0-9]+

%%


" "         ;
{NUMBER}    {
                yylval.i = atoi(yytext);
                return(NUMBER);
            }
[^0-9\n]    {
                return(yytext[0]);
            }

%%
