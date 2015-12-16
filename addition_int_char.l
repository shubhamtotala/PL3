%{
#include"y.tab.h"
%}
%%
[0-9] {yylval.val=yytext[0]; return num;}
[a-z] {yylval.val1=yytext[0]; return ID;}
"+" {return '+';}
\n {return '\n';}
%%
int yywrap()
{
return 1;
}

