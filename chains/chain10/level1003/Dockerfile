FROM bash

RUN 	adduser -D suzen

WORKDIR /home/suzen

ADD directories/. /home/suzen/
ADD diary.txt /home/suzen/
ADD hello /bin/hello

RUN	chown -R suzen:suzen /home/suzen/ && \
	chmod 755 -R /home/suzen && \
	rm /bin/mkdir 

USER suzen

ENTRYPOINT ["/bin/hello"]

# Это как бы восстановление файлов из корзины через терминал в каком-нибудь убунту
# cd ~/.local/share/Trash/files
# for file in *; do path=$(grep Path= ~/.local/share/Trash/info/$file.trashinfo | sed -r 's/Path=//'); mv $file $path; done
# cd ~/.local/share/Trash/info
# rm *
# ls ~/
