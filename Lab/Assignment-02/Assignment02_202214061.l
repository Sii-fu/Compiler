%option noyywrap
%{
    #include <stdio.h>
    #include "SymbolTable.h"

    int line = 1;
    FILE *yyoutlog;
    SymbolTable T;

%}

digit [0-9]
int {digit}+(E[-+]?{digit}+)?
float {digit}*\.{digit}+(E[-+]?{digit}+)?
illInt ({digit}*\.{digit}+\.{digit}+)
illInt2 ({digit}+E{digit}+\.{digit}+)

delim [ \t\n]
letter [a-zA-Z]
id [a-zA-Z_][a-zA-Z0-9_]*
char '[^{delim}]'
string \"([^"\\]|\\.)*\"

unfinished_char '[^'\n ;]*
multi_char '[^{delim}][^']+'





%%
if {
    fprintf(yyout, "<IF>");
    fprintf(yyoutlog, "Line No: %d Token <IF> Lexeme %s found\n", line, yytext);
}

else {
    fprintf(yyout, "<ELSE>");
    fprintf(yyoutlog, "Line No: %d Token <ELSE> Lexeme %s found\n", line, yytext);
}

for {
    fprintf(yyout, "<FOR>");
    fprintf(yyoutlog, "Line No: %d Token <FOR> Lexeme %s found\n", line, yytext);
}

while {
    fprintf(yyout, "<WHILE>");
    fprintf(yyoutlog, "Line No: %d Token <WHILE> Lexeme %s found\n", line, yytext);
}

do {
    fprintf(yyout, "<DO>");
    fprintf(yyoutlog, "Line No: %d Token <DO> Lexeme %s found\n", line, yytext);
}

break {
    fprintf(yyout, "<BREAK>");
    fprintf(yyoutlog, "Line No: %d Token <BREAK> Lexeme %s found\n", line, yytext);
}

int {
    fprintf(yyout, "<INT>");
    fprintf(yyoutlog, "Line No: %d Token <INT> Lexeme %s found\n", line, yytext);
}

char {
    fprintf(yyout, "<CHAR>");
    fprintf(yyoutlog, "Line No: %d Token <CHAR> Lexeme %s found\n", line, yytext);
}

float {
    fprintf(yyout, "<FLOAT>");
    fprintf(yyoutlog, "Line No: %d Token <FLOAT> Lexeme %s found\n", line, yytext);
}

double {
    fprintf(yyout, "<DOUBLE>");
    fprintf(yyoutlog, "Line No: %d Token <DOUBLE> Lexeme %s found\n", line, yytext);
}

void {
    fprintf(yyout, "<VOID>");
    fprintf(yyoutlog, "Line No: %d Token <VOID> Lexeme %s found\n", line, yytext);
}

return {
    fprintf(yyout, "<RETURN>");
    fprintf(yyoutlog, "Line No: %d Token <RETURN> Lexeme %s found\n", line, yytext);
}

switch {
    fprintf(yyout, "<SWITCH>");
    fprintf(yyoutlog, "Line No: %d Token <SWITCH> Lexeme %s found\n", line, yytext);
}

case {
    fprintf(yyout, "<CASE>");
    fprintf(yyoutlog, "Line No: %d Token <CASE> Lexeme %s found\n", line, yytext);

}

default {
    fprintf(yyout, "<DEFAULT>");
    fprintf(yyoutlog, "Line No: %d Token <DEFAULT> Lexeme %s found\n", line, yytext);
}

continue {
    fprintf(yyout, "<CONTINUE>");
    fprintf(yyoutlog, "Line No: %d Token <CONTINUE> Lexeme %s found\n", line, yytext);
}




"("{string}")" {
    fprintf(yyout, "<CONST_STRING,");
    for(int i = 1; i < yyleng - 1; i++) {
        fprintf(yyout, "%c", yytext[i]);
    }
    fprintf(yyout, ">");
    fprintf(yyoutlog, "Line No: %d Token <CONST_STRING> Lexeme %s found\n", line, yytext);
    SymbolInfo s("CONST_STRING", yytext);
    T.insert(s);
    T.print();
}

"="[ ]*{string}";" {
    fprintf(yyout, "<CONST_STRING,");
    for(int i = 1; i < yyleng - 1; i++) {
        fprintf(yyout, "%c", yytext[i]);
    }
    fprintf(yyout, ">");
    fprintf(yyoutlog, "Line No: %d Token <CONST_STRING> Lexeme %s found\n", line, yytext);
    SymbolInfo s("CONST_STRING", yytext);
    T.insert(s);
    T.print();
}




"+"|"-" {
    fprintf(yyout, "<ASSIGNOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <ASSIGNOP> Lexeme %s found\n", line, yytext);
}

"*"|"%" {
    fprintf(yyout, "<MULOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <MULOP> Lexeme %s found\n", line, yytext);
}

"++"|"--" {
    fprintf(yyout, "<INCOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <INCOP> Lexeme %s found\n", line, yytext);
}

"=="|"!="|"<"|">"|"<="|">=" {
    fprintf(yyout, "<RELOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <RELOP> Lexeme %s found\n", line, yytext);
}

"&&"|"||" {
    fprintf(yyout, "<LOGICOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <LOGICOP> Lexeme %s found\n", line, yytext);
}

"!" {
    fprintf(yyout, "<NOT,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <NOT> Lexeme %s found\n", line, yytext);
}

"=" {
    fprintf(yyout, "<ASSIGNOP,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <ASSIGNOP> Lexeme %s found\n", line, yytext);
}

"(" {
    fprintf(yyout, "<LPAREN,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <LPAREN> Lexeme %s found\n", line, yytext);
}

")" {
    fprintf(yyout, "<RPAREN,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <RPAREN> Lexeme %s found\n", line, yytext);
}

"{" {
    fprintf(yyout, "<LCURL,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <LCURL> Lexeme %s found\n", line, yytext);
}

"}" {
    fprintf(yyout, "<RCURL,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <RCURL> Lexeme %s found\n", line, yytext);
}

"[" {
    fprintf(yyout, "<LTHIRD,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <LTHIRD> Lexeme %s found\n", line, yytext);
}

"]" {
    fprintf(yyout, "<RTHIRD,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <RTHIRD> Lexeme %s found\n", line, yytext);
}

";" {
    fprintf(yyout, "<SEMICOLON,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <SEMICOLON> Lexeme %s found\n", line, yytext);
}

"," {
    fprintf(yyout, "<COMMA,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <COMMA> Lexeme %s found\n", line, yytext);
}

{illInt} {
    fprintf(yyoutlog, "Error at Line No: %d Ill formated number %s\n", line, yytext);
}
{illInt2} {
    fprintf(yyoutlog, "Error at Line No: %d Ill formated number %s\n", line, yytext);
}


{int} {
    fprintf(yyout, "<CONST_INT,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <CONST_INT> Lexeme %s found\n", line, yytext);
    SymbolInfo s("CONST_INT", yytext);
    T.insert(s);
    T.print();
}

{float} {
    fprintf(yyout, "<CONST_FLOAT,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <CONST_FLOAT> Lexeme %s found\n", line, yytext);
    SymbolInfo s("CONST_FLOAT", yytext);
    T.insert(s);
    T.print();
}

{char} {
    fprintf(yyout, "<CONST_CHAR,");
    for(int i = 1; i < yyleng - 1; i++) {
        fprintf(yyout, "%c", yytext[i]);
    }
    fprintf(yyout, ">");
    fprintf(yyoutlog, "Line No: %d Token <CONST_CHAR> Lexeme %s found\n", line, yytext);
    SymbolInfo s("CONST_CHAR", yytext);
    T.insert(s);
    T.print();
}

{multi_char} {
    fprintf(yyoutlog, "Error at Line No: %d Multi character constant error %s\n", line, yytext);

}

{unfinished_char} {
    fprintf(yyoutlog, "Error at Line No: %d Unfinished character %s\n", line, yytext);
}




{id} {
    fprintf(yyout, "<ID,%s>", yytext);
    fprintf(yyoutlog, "Line No: %d Token <ID> Lexeme %s found\n", line, yytext);
    SymbolInfo s("ID", yytext);
    T.insert(s);
    T.print();
}


{delim} {
    if(yytext[0] == '\n') {
        line++;
    }
    fprintf(yyout, "\n");
}

. {
    fprintf(yyoutlog, "Error at Line No: %d Unauthorized Character %s\n", line, yytext);
}

%%
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yyout = fopen(argv[2], "w");
    
    yyoutlog = freopen("log.txt", "w", stdout);
    yylex();
    return 0;
} 
