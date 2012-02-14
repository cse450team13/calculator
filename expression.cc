#include <cstdio>
#include <iostream>
#include <list>

using namespace std;

extern "C" {
#include "y.tab.h"
  extern FILE *yyin;
  extern int yylex();
  extern int yyparse();
  extern char *yytext;
}

extern "C" void answer(int n)
{
	cout << "Answer from C++:  " << n << endl;
}


int main(int argc, char **argv)
{
  FILE *file;

  if(argc < 2)
  {
       fprintf(stderr, "Using Standard input: Use ^D to exit.\n");
       file = stdin; 
  } else {
	  file = fopen(argv[1], "r");
  }

  if(!file)
  {
      fprintf(stderr, "Unable to open file %s", argv[1]);
      return 1;
  }

  cout << "Simple 2.0!" << endl;

  yyin = file;

  do
    {
      yyparse();
    } while(!feof(yyin));

  return 0;
}


extern "C" void yyerror(char *s)
{ 
  cout << s << endl;
}
