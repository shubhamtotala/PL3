%{
#include<stdio.h>
#include<stdlib.h>
%}

%union
{
 int val;
 char val1;
};
%token <val> ID
%token '\n' '+'
%type <val> S E
%left '+'


%%
S: E '\n' {printf("correct"); exit(0);}
;
E: E'+'E
|ID
;


%%
int main()
{
	yyparse();
}

int yyerror(char *msg)
{
	printf("Syntax error");
}

