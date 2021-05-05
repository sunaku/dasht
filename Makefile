PREFIX ?= $(HOME)/.local

# INSTALL = install -d # NetBSD
INSTALL = install -D # GNU coreutils

all:
	@echo "Usage: make install              # installs to $(PREFIX)"
	@echo "Usage: make install PREFIX=...   # installs to PREFIX"
	@echo "Usage: make uninstall            # uninstalls from $(PREFIX)"
	@echo "Usage: make uninstall PREFIX=... # uninstalls from PREFIX"

install:
	find bin     -type f -exec $(INSTALL) -m 755 '{}' $(PREFIX)/'{}' \;
	find etc man -type f -exec $(INSTALL) -m 644 '{}' $(PREFIX)/'{}' \;
	@echo "$$PATH"    | tr ':' '\n' | grep -F -q -x $(PREFIX)/bin || echo "WARNING: $(PREFIX)/bin is not in your \$$PATH"    >&2
	@echo "$$MANPATH" | tr ':' '\n' | grep -F -q -x $(PREFIX)/man || echo "WARNING: $(PREFIX)/man is not in your \$$MANPATH" >&2

uninstall:
	-find bin etc man        -type f -exec rm -v -f $(PREFIX)/'{}' \;
	-find bin etc man -depth -type d -exec rmdir    $(PREFIX)/'{}' \;
	@echo "$$PATH"    | tr ':' '\n' | grep -F -q -x $(PREFIX)/bin && echo "WARNING: $(PREFIX)/bin is still in your \$$PATH"    >&2 || :
	@echo "$$MANPATH" | tr ':' '\n' | grep -F -q -x $(PREFIX)/man && echo "WARNING: $(PREFIX)/man is still in your \$$MANPATH" >&2 || :

.PHONY: all install uninstall
