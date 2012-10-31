NAMES   := CORBA TimeBase DsLogAdmin
DESTDIR  = $(HOME)/.st
PKGS     = $(addprefix $(DESTDIR)/,$(NAMES:=.star))
tolower  = $(shell echo $(1) | tr '[:upper:]' '[:lower:]')

.PHONY: all clean idl check

all: idl $(PKGS)

clean:
	$(MAKE) -C idl clean

idl:
	$(MAKE) -C $@

$(DESTDIR)/CORBA.star: corba/CORBA.st corba/ORBit.st corba/ORBitTypeCode.st corba/CORBATests.st corba/ORBitTests.st corba/package.xml
$(DESTDIR)/TimeBase.star: timebase/TimeBase.st timebase/ORBitTimeBase.st timebase/TimeBaseTests.st timebase/package.xml
$(DESTDIR)/DsLogAdmin.star: dslogadmin/DsLogAdmin.st dslogadmin/ORBitDsLogAdmin.st dslogadmin/DsLogAdminTests.st dslogadmin/package.xml

%.star:
	cd $(call tolower,$(@F:.star=)) && gst-package -t $(DESTDIR) package.xml

check: all
	for p in $(NAMES) ; do gst-sunit -v -p $$p ; done
