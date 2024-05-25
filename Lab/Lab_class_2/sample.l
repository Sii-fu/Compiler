
%{
    #include <stdio.h>

    int yywrap();
    int yywrap() { return 1; }
    int line_count = 0;
%}

ID [a-zA-Z][a-zA-Z0-9]*
digit [0-9]
int {digit}+
float {digit}*?\.{digit}+?

%%
{int} {fprintf(yyout,"<INT,Text: %s, Length: %d>\n", yytext, yyleng);}


{float} {fprintf(yyout,"<FLOAT,Text: %s, Length: %d>\n", yytext, yyleng);}
{ID} {fprintf(yyout,"<ID>\n");}
[\n] {line_count++;}


%%

int main()
{
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    printf("Output written to output.txt\n");
    printf("Total lines: %d\n", line_count+1);
    return 0;
}
