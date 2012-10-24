.PHONY : none clean cxxcheck entities
.DEFAULT_GOAL := none

SOURCES := entities.c
OBJECTS := $(SOURCES:%.c=%.o)
TESTS := $(SOURCES:%.c=t-%)
GARBAGE := $(OBJECTS) $(TESTS)

CLANG := clang -std=c99 -Werror -Weverything
CLANGXX := clang++ -std=c++98 -Werror -Weverything -xc++
GCC := gcc -std=c99 -pedantic -Werror -Wall -Wextra
CFLAGS := -O3 -ggdb3
NOWARN :=

CHECK_SYNTAX = $(CLANG) -fsyntax-only $(NOWARN:%=-Wno-%) $<
COMPILE = $(GCC) -c $(CFLAGS) -o $@ $<
BUILD = $(GCC) $(CFLAGS) -o $@ $^
CLEAN = rm -f $(GARBAGE)
CXXCHECK = $(CLANGXX) -fsyntax-only $(NOWARN:%=-Wno-%) $(SOURCES)
RUN = @set -e; for BIN in $^; do echo ./$$BIN; ./$$BIN; done

none :

clean :
	$(CLEAN)

cxxcheck :
	$(CXXCHECK)

entities : % : t-%
	$(RUN)

$(TESTS) : t-% : t-%.c %.o
	$(CHECK_SYNTAX)
	$(BUILD)

$(OBJECTS) : %.o : %.c %.h
	$(CHECK_SYNTAX)
	$(COMPILE)
