
%{
    #include <stdio.h>
    int yywrap();
    int yywrap()
    {
        return 1;
    }

    int iden=0;
    int key=0;
    int newlinecount=0;
%}

NUMBER [0-9]+  
float {NUMBER}(.{NUMBER})?
keyword int|float|char|double|void|return|if|else|while|for|break|continue|switch|case|default|do|goto|auto|enum|extern|register|signed|sizeof|static|struct|typedef|union
identifier [a-zA-Z_][a-zA-Z0-9_]*  

%%

{NUMBER} {fprintf(yyout,"<NUMBER, text: %s, size: %d>",yytext,yyleng);}
{float} {fprintf(yyout,"<FLOAT, text: %s, size: %d>",yytext, yyleng);}
{keyword} {fprintf(yyout,"<KEYWORD, text: %s, size: %d",yytext, yyleng);key++;}
{identifier} {fprintf(yyout,"<ID, text: %s, size: %d",yytext, yyleng);iden++;}
[;] {fprintf(yyout,"<semicolon>"); }
[=] {fprintf(yyout,"<assignment Op>");}
[\n] { fprintf(yyout,"\n");newlinecount++;}




%%

int main()
{
    yyin = fopen("input.txt","r");
    yyout = fopen("output.txt","w");
    yylex();
    printf("\nTotal number of Id: %d",iden);
    printf("\nTotal number of Keywords: %d",key);
    printf("\nTotal number of lines: %d",newlinecount+1);
    return 0;
}





