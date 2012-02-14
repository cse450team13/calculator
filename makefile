expression:	expression.o y.tab.o lex.yy.o
	g++ expression.o y.tab.o lex.yy.o  -o expression

lex.yy.c: expression.l y.tab.h
	flex expression.l

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.c y.tab.h:  expression.y
	bison --yacc --defines expression.y

y.tab.o: y.tab.c y.tab.h
	gcc -c y.tab.c

expression.o: expression.cc y.tab.h
	g++ -c expression.cc
