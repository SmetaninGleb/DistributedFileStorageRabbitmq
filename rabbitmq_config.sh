rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit@rabbit.pid
export document_queue_name
export document_list_queue_name
export rabbitmq_sender_exchange_name
export receivers_number
export receiver_queue_start_name
export rabbitmq_username
export rabbitmq_password
rabbitmqadmin -u $rabbitmq_username -p $rabbitmq_password declare queue name=$document_queue_name
rabbitmqadmin -u $rabbitmq_username -p $rabbitmq_password declare queue name=$document_list_queue_name
rabbitmqadmin -u $rabbitmq_username -p $rabbitmq_password declare exchange name=$rabbitmq_sender_exchange_name type=fanout
for i in `seq 1 $receivers_number`
do
    queuename="${receiver_queue_start_name}_${i}"
    rabbitmqadmin -u $rabbitmq_username -p $rabbitmq_password declare queue name=$queuename
    rabbitmqadmin -u $rabbitmq_username -p $rabbitmq_password declare binding source=$rabbitmq_sender_exchange_name destination=$queuename
done
