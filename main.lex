%{
/* need this for the call to getlogin() below */
#include <unistd.h>

int lineNumber = 1;
int cleanPrintLineNumber = 0;
void cleanPrint(int lineNumber, char* category, char* captured){
  char column1[50] = "";
  if (lineNumber != cleanPrintLineNumber){
    sprintf(column1, "Line %d:", lineNumber);
    sprintf(column1, "%-14s", column1);
    cleanPrintLineNumber = lineNumber;
  }
  else {
    sprintf(column1, "%-14s", "");
  }

  char column2[50] = "";
  sprintf(column2, "%-25s", category);

  printf("%s%s%s\n", column1, column2, captured);
}

%}

%option noyywrap

STRING_LIT	\'(\\.|[^'\\])*\'
RESERVED	(procedure|endwhile|forever|endcase|return|output|endfor|repeat|array|input|until|while|stop|call|node|loop|case|else|then|cond|exit|true|false|null|end|for|by|to|do|if|to|go)
SEPARATOR	\(|\)|;|,|:|\[|\]
COMPARISON_OP	<=|>=|==|!=|>|<
MATH_OP	=|\+|-|\*|\/|\^
LOGICAL_OP	(and|or|not)
COMMENT	\/\/.*\n
IDENTIFIER	[a-zA-Z_][a-zA-Z0-9_]*
NUM_LIT	[0-9]+(\.[0-9]+)?

%%
{COMMENT}	{ lineNumber++; }
{STRING_LIT}	{ cleanPrint(lineNumber, "String Literal", yytext); }
{RESERVED}	{ cleanPrint(lineNumber, "Reserved Word", yytext); }
{SEPARATOR}	{ cleanPrint(lineNumber, "Separator", yytext); }
{COMPARISON_OP}	{ cleanPrint(lineNumber, "Comparison Operator", yytext); }
{MATH_OP}	{ cleanPrint(lineNumber, "Math Operator", yytext); }
{LOGICAL_OP}	{ cleanPrint(lineNumber, "Logical Operator", yytext); }
{IDENTIFIER}	{ cleanPrint(lineNumber, "Identifier", yytext); }
{NUM_LIT}	{ cleanPrint(lineNumber, "Numerical Literal", yytext); }
\n	{ lineNumber++;}
\ 	{}
%%

int main()
{
  yylex();
}

