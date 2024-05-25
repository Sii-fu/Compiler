
%option noyywrap
%{
    #include <stdio.h>
    #include "61.h"
    FILE *logFile;
    SymbolTable T;
    int lineCount=1;
%}
ID _?[a-zA-Z][a-zA-Z0-9]*


digit [0-9]+
float [0-9][\.][0-9]+
Const_int {digit}+

%%

int {
            fprintf(yyout,"<INT,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <INT> found\n",yytext);
    
}
float {
            fprintf(yyout,"<FLOAT,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <FLOAT> found\n",yytext);
    
}
char {
            fprintf(yyout,"<CHAR,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <CHAR> found\n",yytext);
    
}
void {
            fprintf(yyout,"<VOID,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <VOID> found\n",yytext);
    
}
main {
            fprintf(yyout,"<MAIN,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <MAIN> found\n",yytext);
    
}
return {
            fprintf(yyout,"<RETURN,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <RETURN> found\n",yytext);
    
}
if {
            fprintf(yyout,"<IF,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <IF> found\n",yytext);
    
}
else {
            fprintf(yyout,"<ELSE,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <ELSE> found\n",yytext);
    
}
while {
            fprintf(yyout,"<WHILE,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <WHILE> found\n",yytext);
    
}
for {
            fprintf(yyout,"<FOR,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <FOR> found\n",yytext);
    
}


{ID}    {
            fprintf(yyout,"<ID,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <ID,%s> inserted in the table\n",yytext);
            SymbolInfo a("ID",yytext);
            T.insert(a);

        }
{Const_int} {
            fprintf(yyout,"<CONST_INT,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <CONST_INT,%s> inserted in the table\n",yytext);
            SymbolInfo a("CONST_INT",yytext);
            T.insert(a);
        }
{float} {
            fprintf(yyout,"<FLOAT,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <FLOAT,%s> inserted in the table\n",yytext);
            SymbolInfo a("FLOAT",yytext);
            T.insert(a);
        }

[\n] {lineCount++;}
=       {
            fprintf(yyout,"<ASSIGNOP,%s>",yytext);
            fprintf(logFile,"Line No: %d  ",lineCount);
            fprintf(logFile,"Token <ASSIGNOP> found\n",yytext);
        }
; {fprintf(yyout,"<SEMICOLON,%s>",yytext);}
[ ] {;}


%%

int main()
{
    
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    logFile = fopen("log.txt", "w");
    yylex();
    T.print();
    return 0;
}