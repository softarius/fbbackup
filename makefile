NAME=fbbackup

all: $(NAME).deb

$(NAME).deb:
	dpkg-deb --build . $(NAME).deb

clean: $(NAME).deb
	rm $(NAME).deb

install: $(NAME).deb
	dpkg -i $(NAME).deb 