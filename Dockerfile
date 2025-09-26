FROM postgres:16

# TimeZone
ENV TZ=Asia/Bangkok


COPY db/migration/ /docker-entrypoint-initdb.d/


RUN find /docker-entrypoint-initdb.d -type f -name "*.sql" -exec sed -i 's/\r$//' {} \;
