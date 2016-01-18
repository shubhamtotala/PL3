%{
#include"y.tab.h"
%}
%%
[a-z] {yylval.val=yytext[0]; return ID;}
"+" {return '+';}
\n {return '\n';}
%%
int yywrap()
{
return 1;
}

