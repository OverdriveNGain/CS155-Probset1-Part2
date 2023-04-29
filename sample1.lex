%{
/* need this for the call to getlogin() below */
#include <unistd.h>

int lineNumber = 1;
%}

%option noyywrap

STRING_LIT	\'(\\.|[^'\\])*\'
RESERVED	(procedure|endwhile|forever|endcase|return|output|endfor|repeat|array|input|until|while|stop|call|node|loop|case|else|then|cond|exit|true|false|null|end|for|by|to|do|if|to|go)
SEPARATOR	\(|\)|;|,|:
COMPARISON_OP	<=|>=|==|!=|>|<
MATH_OP	=|\+|-|\*|\/|\^
LOGICAL_OP	(and|or|not)
COMMENT	\/\/.*\n
IDENTIFIER	[a-zA-Z_][a-zA-Z0-9_]*
NUM_LIT	[0-9]+(\.[0-9]+)?

%%
{COMMENT}	{}
{STRING_LIT}	{ printf("String Literal\n"); }
{RESERVED}	{ printf("Reserved Word: %s (at line %d)\n", yytext, lineNumber); }
{SEPARATOR}	{ printf("Separator\n"); }
{COMPARISON_OP}	{ printf("Comparison Operator\n"); }
{MATH_OP}	{ printf("Math Operator\n"); }
{LOGICAL_OP}	{ printf("Logical Operator\n"); }
{IDENTIFIER}	{ printf("Identifier\n"); }
{NUM_LIT}	{ printf("Numerical Literal\n"); }
\n	{ lineNumber++;}
\t	{ printf("Tab\n");}
\ 	{}
%%

int main()
{
  yylex();
}

