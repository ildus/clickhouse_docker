FROM amd64/archlinux:latest
ADD ClickHouse/build/programs/clickhouse /programs/clickhouse

ADD ./clickhouse-config.xml /etc/clickhouse-server/config.xml
ADD ./clickhouse-users.xml /etc/clickhouse-server/users.xml
EXPOSE 8123
EXPOSE 9000

VOLUME /etc/clickhouse-server
VOLUME /var/lib/clickhouse

ADD ./start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod +x /programs/clickhouse
ENTRYPOINT ["/start.sh"]
