%{ 
  #include<stdio.h> 
  #include <string.h>
  #include <stdlib.h>
  #include "mybison.tab.h" 
  extern YYSTYPE yylval; 
%} 
  

%% 
[a-z] {	yylval.idVal=strdup(yytext); return ID;}
[0-9]+ { 
          yylval.intVal=atoi(yytext); 
          return NUMBER; 
       }
"sqrt" {
		return SQRT;
		}
"log" {
		return LOG;
		}
"=" { return EQUAL;}
"*" { return MULT;}
"/" { return DIVIDE;}
"+" { return PLUS;}
"-" { return MINES;}
"(" {return OPEN;};
")" {return CLOSE;};

  
[\n] ; 
  

  
%% 
  
 int yywrap() 
{ 
 return 1; 
} 
