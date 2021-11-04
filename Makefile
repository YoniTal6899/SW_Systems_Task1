CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LOOP_LIB=basicClassification.o advancedClassificationLoop.o
OBJECTS_REC_LIB=basicClassification.o advancedClassificationRecursion.o
FLAGS= -Wall -g
.PHONY: all clean loops loopd recursived recursives mains maindloop maindrec

all: mains maindloop maindrec

#Link main with Static Rec library
mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains.out $(OBJECTS_MAIN) -L. libclassrec.a -lm

#Links main with Dynamic loop library
maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) $(OBJECTS_MAIN) -L. libclassloops.so -o maindloop.out

#Links main with Dynamic rec library
maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) $(OBJECTS_MAIN) -L. libclassrec.so -o maindrec.out -lm

#Create Static library (loops)
loops: $(OBJECTS_LOOP_LIB)
	#ifndef LIB_LOOPS
		$(AR) -rcs libclassloops.a $(OBJECTS_LOOP_LIB)

#Create Static library (Rec)
recursives: $(OBJECTS_REC_LIB)
	#ifndef LIB_recs
		$(AR) -rcs libclassrec.a $(OBJECTS_REC_LIB)

#Create Dynamic library (Rec)
recursived: $(OBJECTS_REC_LIB)
	#ifndef LIB_recd
		$(CC) -shared -o libclassrec.so $(OBJECTS_REC_LIB) 

#Create Dynamic library (loops)
loopd: $(OBJECTS_LOOP_LIB)
	#ifndef LIB_LOOPD
		$(CC) -shared -o libclassloops.so $(OBJECTS_LOOP_LIB)

######
libclassloops.so: $(OBJECTS_LOOP_LIB)
	#ifndef LIB_LOOPS
	#define LIB_LOOPS
	$(CC) $(FLAGS) $(OBJECTS_LOOP_LIB) -shared -o libclassloops.so

libclassrec.so: $(OBJECTS_REC_LIB)
	#ifndef LIB_recD
	#define LIB_recD
	$(CC) $(FLAGS) $(OBJECTS_REC_LIB) -shared -o libclassrec.so

libclassrec.a: $(OBJECTS_REC_LIB)
	#ifndef LIB_recs
	#define LIB_recs
	$(AR) -rcs libclassrec.a $(OBJECTS_REC_LIB)

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

main.o: main.c NumClass.h  
	$(CC) $(FLAGS) -c main.c 

clean:
	rm -f *.o *.a *.so *.out
