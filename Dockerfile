# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python3 && pyvenv "ciimAdmin"

ADD . /srv/ciimAdmin/ciimAdmin
RUN cd "ciimAdmin" && source bin/activate && pip3 install -r "ciimAdmin/requirements.txt"


EXPOSE 8000
CMD source /srv/ciimAdmin/bin/activate && \
 /srv/ciimAdmin/ciimAdmin/manage.py runserver 0.0.0.0:8000
