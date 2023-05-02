ACLOCAL_AMFLAGS = -I config

SUBDIRS = src \
  tests

EXTRA_DIST = myapp.spec \
	debian

rpm :
	$(MAKE) dist
	mkdir -p ./rpmbuild/SOURCES/
	cp -f myapp-0.0.1.tar.gz ./rpmbuild/SOURCES/
	rpmbuild -bb \
	  --target=aarch64-poky-linux \
	  --define "_topdir `pwd`/rpmbuild" \
	  myapp.spec
	cp -f ./rpmbuild/RPMS/aarch64/myapp-0.0.1-1.el9.aarch64.rpm .

install-rpm :
	sudo rpm -vhi \
		--prefix /opt/poky/2.4.4/sysroots/aarch64-poky-linux/usr \
		--ignorearch myapp-0.0.1-1.aarch64.rpm

uninstall-rpm:
	sudo rpm -e myapp

reinstall-rpm:
	$(MAKE) uninstall-rpm install-rpm

dpkg :
	sh mkdebpkg.sh ctrl --package $(PACKAGE_NAME) --version $(PACKAGE_VERSION)
	$(MAKE) dist
	cp -f $(PACKAGE_NAME)-$(PACKAGE_VERSION).tar.gz \
		$(PACKAGE_NAME)_$(PACKAGE_VERSION).tar.gz
	sh mkdebpkg.sh dsc  --package $(PACKAGE_NAME) --version $(PACKAGE_VERSION)

	rm -rf ./debbuild
	echo "extract source ..."
	dpkg-source -x $(PACKAGE_NAME)_$(PACKAGE_VERSION).dsc ./debbuild
	echo "build package ..."
	cd debbuild && \
		dpkg-buildpackage -rfakeroot -b -us -uc

print-%  :
	@echo $($*)

