CC = gcc
LIBS = `pkg-config --libs gtk+-2.0`
INCS = `pkg-config --cflags gtk+-2.0`
#LIBS = `gtk-config --libs`
#INCS = `gtk-config --cflags`

CFLAGS += -Wall -g
CFLAGS += $(CPPFLAGS)

main: gexec
gexec: autocomp.o gexec.o
	$(CC) autocomp.o gexec.o -o gexec $(LDFLAGS) $(LIBS)

gexec.o: gexec.c
	$(CC) -c gexec.c $(INCS) $(CFLAGS)
autocomp.o: autocomp.c autocomp.h
	$(CC) -c autocomp.c $(INCS) $(CFLAGS)
clean:
	rm -f gexec
	rm -f *.o
install:
	install -m755 -D gexec $(DESTDIR)/usr/bin/gexec
	install -m644 -D gexec.1 $(DESTDIR)/usr/share/man/man1/gexec.1
