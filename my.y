%{
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <sys/stat.h>

FILE *yyin; //input file pointer
%}

%union {
         int i;
       }
%token digit

%start list
%type <i> expr
%token <i> NUMBER 

%left '+' '-'
%left '*' '/'

//rule section
%%

list: |                     
    list stat '\n'
    |
    list error '\n'{ yyerrok; }
    ;

stat:   expr { printf("Ans = %d\n",$1);     }
    ;

expr: expr '*' expr { $$ = $1 * $3; }
    |
    expr '/' expr { $$ = $1 / $3; }
    |
    expr '+' expr { $$ = $1 + $3; }
    |
    expr '-' expr { $$ = $1 - $3; }
    |
    NUMBER
    ;

%%


int yyerror()
{
    return 1;
}


int main(int argc, char *argv[])
{
	
    int num,i;
    printf("How many operations u want to perform??\n");
    scanf("%d", &num);

    int error, count = 0;
    FILE *fp0, *fp1, *fp2, *main_file;
    char line[256];
    size_t len = 0;
    char read;
	char fname[3][10]={"text0.txt","text1.txt","text2.txt"};


    main_file = fopen("text.txt", "r");


        fgets(line, sizeof(line), main_file);
        fp0 = fopen("text0.txt", "w");
	printf("\n line1 = %s",line);
        fprintf(fp0, "%s", line);
        fclose(fp0);
 
        fgets(line, sizeof(line), main_file);
        fp1 = fopen("text1.txt", "w");
	printf("\n line2 = %s",line);
        fprintf(fp1, "%s", line);
        fclose(fp1);
 
        fgets(line, sizeof(line), main_file);
        fp2 = fopen("text2.txt", "w");
	printf("\n line3 = %s",line);
        fprintf(fp2, "%s", line);
        fclose(fp2);
	fclose(main_file);

	
	for (num=0;num<3;num++)
	{	
	printf("\n filename = %s", fname[num]);
    	yyin = fopen(fname[num],"r");
	
	if(yyin == NULL)
		printf("\n input not received");
	else
	{
		yyparse();
	   fclose(yyin);
	}

	}	

        
    return 0;
}


