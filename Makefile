FLAG=-Wall -g
CC=gcc
AR=ar

all: mains maindloop maindrec libclassloops.a libclassloops.so libclassrec.a libclassrec.so
loops:libclassloops.a
loopd:libclassloops.so
recursives:libclassrec.a
recursived:libclassrec.so
	
mains: main.o libclassrec.a
	$(CC) $(FLAG) -g -o mains main.o libclassrec.a -lm
maindloop: main.o libclassloops.so
	$(CC) $(FLAG) -g -o maindloop main.o ./libclassloops.so -lm
maindrec: main.o libclassrec.so
	$(CC) $(FLAG) -g -o maindrec main.o ./libclassrec.so -lm
	
libclassloops.a: advancedClassificationLoop.o basicClassification.o
	$(AR) rcs -o libclassloops.a advancedClassificationLoop.o basicClassification.o
	
libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) rcs -o libclassrec.a advancedClassificationRecursion.o basicClassification.o
	
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared advancedClassificationRecursion.o basicClassification.o -o libclassrec.so

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h 
	$(CC) $(FLAG) -g -c advancedClassificationRecursion.c
	
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAG) -g -c advancedClassificationLoop.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAG) -g -c basicClassification.c 

main.o: NumClass.h main.c
	$(CC) $(FLAG) -g -c main.c


.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec