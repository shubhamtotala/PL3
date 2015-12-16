%%
[0-9]* {printf("numbers");}
[a-zA-Z]* {printf("string");}
%%
int main()
{
	yylex();
}
