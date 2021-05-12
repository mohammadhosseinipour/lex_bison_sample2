%{ 
	#include <stdio.h>
	#include <math.h>
	extern int yylex();
	void yyerror();
	char* var_name[100];
	int var_val[100];
	int count,i;
	int flag;
%}

%union{
	int intVal;
	char* idVal;
	}
  
%token <intVal> NUMBER;
%token <idVal> ID;
%token  SQRT LOG;
%token  MINES MULT EQUAL PLUS DIVIDE OPEN CLOSE;
  
%left PLUS MINES;
  
%left MULT DIVIDE ;
  
%left OPEN CLOSE ;
  
%type <intVal>  s start exp function
%% 
s:		s start | ;
start:	exp { printf("result: %d",$1)}
		|ID EQUAL exp{
					for(i=0;i++;i<count+1)
					{
					if($1==var_name[i])
					{
						var_val[i]=$3;
						break;
					}
					else
					{
						if(i==count)
						{
							var_name[count]=$1;
							var_val[count]=$3;
							count++;
						}
						
					}
					}
					};

exp:	exp PLUS exp{$$ = $1 + $3;}
		|exp MULT exp{$$ = $1 * $3;}
		|exp DIVIDE exp{ $$ = $1 / $3;}
		|exp MINES exp{$$ = $1 - $3; }
		|OPEN exp CLOSE{$$ = $2;}
		|function OPEN exp CLOSE{if($1==1)
								{
									$$=sqrt($3);
								}
								else if($1==2)
								{
									$$=log($3);
								}
								}
		|NUMBER{$$=$1;}
		|ID{for(i=0;i++;i<100)
		{
			if($1==var_name[i])
			{
			$$=var_val[i];
			}
		}
		};

function:	LOG{$$=1;}
			|SQRT{$$=2;};
  
%% 
  
//driver code 
void main() 
{ 
   printf("\nEnter your phrase( enter ans to see the result) :\n"); 
  count=0;
  flag=0;
   yyparse(); 
   if(flag==0) 
   printf("\nEntered arithmetic expression is Valid\n\n"); 
} 
  
void yyerror() 
{  
   flag=1; 
} 