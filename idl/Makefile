IDL   := TimeBase.idl DsLogAdmin.idl
GEN   := ../generated
STUBS := $(addprefix $(GEN)/,$(IDL:.idl=-stubs.c) $(IDL:.idl=-common.c) $(IDL:.idl=.h))
OBJ   := $(filter-out %.h,$(STUBS:.c=.o))
LIB   := $(GEN)/libtls_orbit_stubs.so

CFLAGS  += -fPIC -Wall $(shell pkg-config --cflags ORBit-2.0)
LDFLAGS += -shared $(shell pkg-config --libs ORBit-2.0)

ifeq ($(debug),1)
CFLAGS += -O0 -g
endif

.PHONY: all clean
.PRECIOUS: $(STUBS)

all: $(GEN) $(LIB)

clean:
	rm -Rf $(GEN)

$(GEN):
	mkdir -p $@

$(GEN)/%-stubs.c $(GEN)/%-common.c $(GEN)/%.h: %.idl
	orbit-idl-2 --output-dir=$(GEN) -I ../idl --noskels --onlytop ../idl/$<

$(LIB): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^
