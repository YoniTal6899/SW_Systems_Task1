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
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP_LIB)

#Create Static library (Rec)
recursives: $(OBJECTS_REC_LIB)
	$(AR) -rcs libclassrec.a $(OBJECTS_REC_LIB)

#Create Dynamic library (Rec)
recursived: $(OBJECTS_REC_LIB)
	$(CC) -shared -o libclassrec.so $(OBJECTS_REC_LIB) 

#Create Dynamic library (loops)
loopd: $(OBJECTS_LOOP_LIB)
	$(CC) -shared -o libclassloops.so $(OBJECTS_LOOP_LIB)

######
libclassloops.so: $(OBJECTS_LOOP_LIB)
	$(CC) $(FLAGS) -shared -o libclassloops.so $(OBJECTS_LOOP_LIB)

libclassrec.so: $(OBJECTS_REC_LIB)
	$(CC) $(FLAGS) $(OBJECTS_REC_LIB) -shared -o libclassrec.so

libclassloops.a: $(OBJECTS_LOOP_LIB)
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP_LIB)

libclassrec.a: $(OBJECTS_REC_LIB)
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
