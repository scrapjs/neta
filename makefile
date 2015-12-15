DIST = ./dist
NAME = campfire
VERS = 0.36.0
ARCH = x64
PLATFORM = 'linux'
pack = node_modules/electron-packager/cli.js

all:
	$(pack) . $(NAME) --platform=$(PLATFORM) --arch=$(ARCH) --version=$(VERS) --out=$(DIST) --prune --ignore=node_modules/\.bin

zip: all
	tar -zcvf dist/campfire-$(PLATFORM)-$(ARCH).tar.gz dist/campfire-$(PLATFORM)-$(ARCH)

clean:
	rm -rf $(DIST)

install: linux
	mv $(dist)/campfire-linux-x64 /usr/share/campfire
	ln -s /usr/share/campfire/campfire /usr/bin/campfire

uninstall:
	rm -rf /usr/share/campfire
	rm /usr/bin/campfire
