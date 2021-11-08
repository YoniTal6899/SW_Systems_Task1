CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LOOP_LIB=basicClassification.o advancedClassificationLoop.o
OBJECTS_REC_LIB=basicClassification.o advancedClassificationRecursion.o
FLAGS= -Wall -g
.PHONY: all clean loops loopd recursived recursives mains maindloop maindrec

all: loops mains maindloop maindrec 
maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec.out $(OBJECTS_MAIN) ./libclassrec.so
maindloop: $(OBJECTS_MAIN) libclassloops.so 
	$(CC) $(FLAGS) -o maindloop.out $(OBJECTS_MAIN) ./libclassloops.so
mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains.out $(OBJECTS_MAIN) libclassrec.a 

loopd: libclassloops.so
recursived: libclassrec.so
loops: libclassloops.a
recursives: libclassrec.a

libclassloops.so: $(OBJECTS_LOOP_LIB)
	$(CC) -shared -o libclassloops.so $(OBJECTS_LOOP_LIB)
libclassrec.so: $(OBJECTS_REC_LIB)
	$(CC) -shared -o libclassrec.so $(OBJECTS_REC_LIB)
libclassrec.a: $(OBJECTS_REC_LIB)
	$(AR) -rcs libclassrec.a $(OBJECTS_REC_LIB)
libclassloops.a: $(OBJECTS_LOOP_LIB)
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP_LIB)
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c 
main.o : main.c NumClass.h
	$(CC) $(FLAGS) -c main.c
clean:
	rm -f *.o *.a *.so *.out