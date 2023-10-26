FROM rabbitmq:3-management
WORKDIR /
COPY . .
RUN chmod +x /rabbitmq_config.sh
CMD ["bin/bash", "./start_server.sh"]