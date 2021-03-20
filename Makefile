CC = gcc
LIBS = `pkg-config --libs gtk+-2.0`
INCS = `pkg-config --cflags gtk+-2.0`
#LIBS = `gtk-config --libs`
#INCS = `gtk-config --cflags`

FLAGS = -Wall -g

main: gexec
gexec: autocomp.o gexec.o
	$(CC) autocomp.o gexec.o -o gexec $(LIBS) $(INCS) $(FLAGS)

gexec.o: gexec.c
	$(CC) -c gexec.c $(INCS) $(FLAGS)
autocomp.o: autocomp.c autocomp.h
	$(CC) -c autocomp.c $(INCS) $(FLAGS)
clean:
	-rm gexec
	-rm *.o
install:
	install -m755 -D gexec $(DESTDIR)/usr/bin/gexec
	install -m644 -D gexec.1 $(DESTDIR)/usr/share/man/man1/gexec.1
