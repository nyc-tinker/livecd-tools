
VERSION = 005

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL_PROGRAM}

all: 

install:
	$(INSTALL_PROGRAM) -D creator/livecd-creator $(DESTDIR)/usr/bin/livecd-creator
	$(INSTALL_PROGRAM) -D creator/isotostick.sh $(DESTDIR)/usr/bin/livecd-iso-to-disk
	$(INSTALL_PROGRAM) -D creator/mayflower $(DESTDIR)/usr/lib/livecd-creator/mayflower
	$(INSTALL_DATA) -D AUTHORS $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)/AUTHORS
	$(INSTALL_DATA) -D COPYING $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)/COPYING
	$(INSTALL_DATA) -D README $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)/README
	$(INSTALL_DATA) -D HACKING $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)/HACKING
	$(INSTALL_DATA) -D TODO $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)/TODO
	$(INSTALL_DATA) -D config/livecd-fedora-minimal.ks $(DESTDIR)/usr/share/livecd-tools/livecd-fedora-minimal.ks
	$(INSTALL_DATA) -D config/livecd-fedora-desktop.ks $(DESTDIR)/usr/share/livecd-tools/livecd-fedora-desktop.ks

#	$(INSTALL_PROGRAM) -D installer/livecd-installer $(DESTDIR)/usr/libexec/livecd-installer
#	$(INSTALL_PROGRAM) -D installer/livecd-installer-tui $(DESTDIR)/usr/bin/livecd-installer-tui
#	$(INSTALL_PROGRAM) -D installer/livecd-install-daemon $(DESTDIR)/etc/rc.d/init.d/livecd-install-daemon
#	$(INSTALL_PROGRAM) -D installer/99-livecd-installer.conf $(DESTDIR)/etc/livecd/99-livecd-installer.conf
#	$(INSTALL_DATA) -D installer/livecd-installer.conf $(DESTDIR)/etc/dbus-1/system.d/livecd-installer.conf

uninstall:
	rm -f $(DESTDIR)/usr/bin/livecd-creator
	rm -rf $(DESTDIR)/usr/lib/livecd-creator
	rm -rf $(DESTDIR)/usr/share/doc/livecd-tools-$(VERSION)
	rm -rf $(DESTDIR)/usr/share/livecd-tools

#	rm -f $(DESTDIR)/usr/libexec/livecd-installer
#	rm -f $(DESTDIR)/usr/bin/livecd-installer-tui
#	rm -f $(DESTDIR)/etc/rc.d/init.d/livecd-install-daemon
#	rm -f $(DESTDIR)/etc/dbus-1/system.d/livecd-installer.conf
#	rm -f $(DESTDIR)/etc/livecd/99-livecd-installer.conf

dist : all
	git-tar-tree HEAD livecd-tools-$(VERSION) | bzip2 -9v > livecd-tools-$(VERSION).tar.bz2

clean:
	rm -f *~ creator/*~ installer/*~ config/*~
