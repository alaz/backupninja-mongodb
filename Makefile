NAME:=backupninja-mongodb
VERSION:=0.0.1
BUILD_NUMBER ?= 1
ITERATION:=${BUILD_NUMBER}
FPM_PATH:=./vendor/bin/

.PHONY: all packages clean deb deb-clean rpm rpm-clean

all: packages

deb-clean:
	rm -f *.deb

deb:
	$(FPM_PATH)fpm -t deb \
 -s dir \
 -n $(NAME) \
 --license "Apache License 2.0 "\
 --vendor "devops@devinfotech.co.uk" \
 --maintainer "devops@devinfotech.co.uk" \
 --url "https://github.com/osinka/backupninja-mongodb" \
 --category extra \
 --depends 'backupninja' \
 --version $(VERSION) \
 --iteration $(ITERATION) \
 --architecture all \
 --description "BackupNinja helper for MongoDB" \
 mongodb=/usr/share/backupninja/ \
 mongodb.helper=/usr/share/backupninja/ \
 README.textile=/usr/share/doc/$(NAME)/

rpm-clean:
	rm -f *.rpm

rpm:
	$(FPM_PATH)fpm -t rpm \
 -s dir \
 -n $(NAME) \
 --license "Apache License 2.0 "\
 --vendor "devops@devinfotech.co.uk" \
 --maintainer "devops@devinfotech.co.uk" \
 --url "https://github.com/osinka/backupninja-mongodb" \
 --category extra \
 --depends 'backupninja' \
 --version $(VERSION) \
 --iteration $(ITERATION) \
 --epoch 0 \
 --architecture all \
 --description "BackupNinja helper for MongoDB" \
 mongodb=/usr/share/backupninja/ \
 mongodb.helper=/usr/share/backupninja/ \
 README.textile=/usr/share/doc/$(NAME)/

packages: deb rpm

clean: deb-clean rpm-clean

