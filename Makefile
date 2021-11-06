CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LOOP_LIB=basicClassification.o advancedClassificationLoop.o
OBJECTS_REC_LIB=basicClassification.o advancedClassificationRecursion.o
FLAGS= -Wall -g
.PHONY: all clean loops loopd recursived recursives mains maindloop maindrec

all: mains maindloop maindrec loops recursived recursives loopd

#Link main with Static Rec library
mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains.out $(OBJECTS_MAIN) libclassrec.a

#Links main with Dynamic loop library
maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop.out $(OBJECTS_MAIN) ./libclassloops.so

#Links main with Dynamic rec library
maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec.out $(OBJECTS_MAIN) ./libclassrec.so

#Create Static library (loops)
loops: libclassloops.a

#Create Static library (Rec)
recursives: libclassrec.a

#Create Dynamic library (Rec)
recursived: libclassrec.so

#Create Dynamic library (loops)
loopd: libclassloops.so

######
libclassloops.so: $(OBJECTS_LOOP_LIB)
	$(CC) $(FLAGS) -shared -o libclassloops.so $(OBJECTS_LOOP_LIB)

libclassrec.so: $(OBJECTS_REC_LIB)
	$(CC) $(FLAGS) -shared -o libclassrec.so $(OBJECTS_REC_LIB)

libclassrec.a: $(OBJECTS_REC_LIB)
	$(AR) -rcs libclassrec.a $(OBJECTS_REC_LIB)

libclassloops.a: $(OBJECTS_LOOP_LIB)
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP_LIB)

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

main.o: main.c NumClass.h  
	$(CC) $(FLAGS) -c main.c 

clean:
	rm -f *.o *.a *.so *.out
