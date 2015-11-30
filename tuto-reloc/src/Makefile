# Check PREFIX is correctly set.
ifneq ($(wildcard $(PREFIX)),)
    $(info "INFO: Install directory is: $(PREFIX)")
else
    $(error "ERROR: Install directory (PREFIX='$(PREFIX)') doest not exits. Use: make PREFIX=/path/to/install/prefix")
endif

all: helloA greet.c helloA helloB

greet.c: greet.c.in
	sed s:PREFIX:${PREFIX}: $< > $@

helloA: helloA.in
	sed s:PREFIX:${PREFIX}: $< > $@
	chmod +x helloA

helloB: helloB.o libgreet.so
	$(CC) -o $@ helloB.o -L. -lgreet

libgreet.so: greet.o
	$(CC) -shared -o $@ -Wl,-soname,$(PREFIX)/lib/libgreet.so $<

%.o: %.c
	$(CC) -I. -fPIC -c $<

clean:
	rm -f *.o *.so helloA helloB

install: all
	mkdir -p $(PREFIX)/bin $(PREFIX)/lib
	cp helloA helloB $(PREFIX)/bin
	cp libgreet.so $(PREFIX)/lib
