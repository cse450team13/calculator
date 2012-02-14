%{
/*
 * Expression evaluator
*/
#include "stdio.h"
#define YYSTYPE int

void answer(int n);
%}

%token NUM

%%
S : E			{answer($1);}
S : S '\n'		{}
S : S '\n' E		{answer($3);}
E : E '+' T		{$$ = $1 + $3;}
E : T			{$$ = $1;}
T : T '*' NUM		{$$ = $1 * $3;}
T : NUM			{$$ = $1;}
%%
