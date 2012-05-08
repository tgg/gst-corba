NAMES   := CORBA TimeBase DsLogAdmin
tolower  = $(shell echo $(1) | tr '[:upper:]' '[:lower:]')
SUBDIRS := $(foreach name,$(NAMES),$(call tolower,$name))

.PHONY: all clean idl $(NAMES)

all: idl $(NAMES)

clean:
	$(MAKE) -C idl clean

idl:
	$(MAKE) -C $@

$(NAMES):
	cd $(call tolower,$@) && gst-package -t $(HOME)/.st package.xml && gst-sunit -v -p $@
