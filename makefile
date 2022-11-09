make: projet.lex projet.cup
	jflex projet.lex
	cup projet.cup 
	javac parser.java sym.java Yylex.java

dump: projet.lex projet.cup
	java java_cup.Main -dump projet.cup

run:
	java parser < test1
run-2:
	java parser < test2
run-3:
	java parser < test3

dev: 
	java parser