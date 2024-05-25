%option noyywrap
%{
#include <stdio.h>
int keycount = 0;
%}

keyword int|float|char|double|void|main|return|if|else|while|for|break|continue|switch|case|default|printf|scanf
identifier [a-zA-Z_][a-zA-Z0-9_]*

%%

{keyword} {keycount++; printf("Keyword: %s\n", yytext);}
{identifier} {printf("Identifier: %s\n", yytext);}




%%
int main()
{
    yyin = fopen("input.txt", "r");
    yylex();

    printf("Total Keywords: %d\n", keycount);
    return 0;
}