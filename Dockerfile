# Use our image with Ensemble as a source, we can particular version, or just latest, which will be used as well if omit version.
FROM docker.iscinternal.com:5000/isc-cache:stable

# Destination directory
ENV DESTDIR /opt/gs17

COPY gs17 $DESTDIR

RUN chmod -R a+rx $DESTDIR     && \
	echo _SYSTEM >install.scr  && \
	echo SYS >>install.scr  && \
	echo do \$system.OBJ.Load\(\"$DESTDIR/gs17/Build.cls\",\"ck\"\) >>install.scr  && \
	echo do \#\#class\(gs17.Build\).Build\(\"GS17\",\"$DESTDIR/\"\) >>install.scr  && \
	ccontrol start CACHE && \
	csession CACHE < install.scr && \
	ccontrol stop CACHE quietly
