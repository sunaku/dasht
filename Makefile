.PHONY: all clean
PREFIX ?= ~/.local

# INSTALL = install -d # NetBSD
INSTALL = install -D # GNU coreutils

all:
	mkdir -p bin && ls src | while read command; do sed "s+PREFIX+$(PREFIX)+" "src/$$command" > "bin/$$command"; done
install:
	find bin     -type f -exec $(INSTALL) -m 755 '{}' $(PREFIX)/'{}' \;
	find etc man -type f -exec $(INSTALL) -m 644 '{}' $(PREFIX)/'{}' \;
clean:
	rm -Rf bin
