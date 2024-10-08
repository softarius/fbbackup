NAME=fbbackup

all: $(NAME).deb

../$(NAME).deb: DEBIAN/control usr/bin/$(NAME)
	dpkg-deb --build -Zgzip . ../$(NAME).deb

clean: ../$(NAME).deb
	rm ../$(NAME).deb

install: ../$(NAME).deb
	dpkg -i ../$(NAME).deb 

build: ../$(NAME).deb
	cd .. && dpkg-scanpackages  . > Packages	

deploy: build
		cd .. && sshfs sergey@gis.csir:/var/www/html/repo repo && cp -t repo $(NAME).deb Packages && umount repo