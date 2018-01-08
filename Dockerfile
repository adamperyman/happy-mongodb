FROM mongo:3.6

MAINTAINER <Adam Peryman> adam.peryman@gmail.com

EXPOSE 27017 27017

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

RUN chmod +x /run.sh
RUN chmod +x /set_mongodb_password.sh

CMD ["/run.sh"]
