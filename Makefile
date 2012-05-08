NAMES   := CORBA TimeBase DsLogAdmin
tolower  = $(shell echo $(1) | tr '[:upper:]' '[:lower:]')
SUBDIRS := $(foreach name,$(NAMES),$(call tolower,$name))

.PHONY: all $(NAMES)

all: $(NAMES)

$(NAMES):
	cd $(call tolower,$@) && gst-package -t $(HOME)/.st package.xml && gst-sunit -v -p $@
