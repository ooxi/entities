.PHONY : none clean entities
.DEFAULT_GOAL := none

OBJECTS := entities.o
TESTS := t-entities
GARBAGE := $(OBJECTS) $(TESTS)

CLANG := clang -std=c99 -Werror -Weverything
GCC := gcc -std=c99 -Werror -Wall -Wextra
CFLAGS := -O3 -ggdb3
NOWARN :=

CHECK_SYNTAX = $(CLANG) -fsyntax-only $(NOWARN:%=-Wno-%) $<
COMPILE = $(GCC) -c $(CFLAGS) -o $@ $<
BUILD = $(GCC) $(CFLAGS) -o $@ $^
CLEAN = rm -f $(GARBAGE)
RUN = @set -e; for BIN in $^; do echo ./$$BIN; ./$$BIN; done

none :

clean :
	$(CLEAN)

entities : % : t-%
	$(RUN)

$(TESTS) : t-% : t-%.c %.o %.h
	$(CHECK_SYNTAX)
	$(BUILD)

$(OBJECTS) : %.o : %.c %.h
	$(CHECK_SYNTAX)
	$(COMPILE)
