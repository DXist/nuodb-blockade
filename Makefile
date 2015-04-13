NODE0_IP = $(shell docker exec nuodbpartitioning_node0_1 /sbin/ip address |awk '/global eth0/ { split($$2, array, "/") } END {print array[1]}')
NODE1_IP = $(shell docker exec nuodbpartitioning_node1_1 /sbin/ip address |awk '/global eth0/ { split($$2, array, "/") } END {print array[1]}')
NODE2_IP = $(shell docker exec nuodbpartitioning_node2_1 /sbin/ip address |awk '/global eth0/ { split($$2, array, "/") } END {print array[1]}')

BROWSER ?= chromium
LOCATION ?= /storefront/admin/
open_browser:
	@echo Broker url jdbc:com.nuodb://$(NODE0_IP),$(NODE1_IP),$(NODE2_IP)/Storefront
	@$(BROWSER) http://$(NODE0_IP):9001$(LOCATION)


start_processes: DATABASE_NAME ?= test
start_processes:
	docker exec nuodbpartitioning_node0_1 /bin/bash -c "DATABASE_NAME=$(DATABASE_NAME) BROKER_ALT_ADDR=$(NODE0_IP) /start_db.sh"
	docker exec nuodbpartitioning_node1_1 /bin/bash -c "DATABASE_NAME=$(DATABASE_NAME) BROKER_ALT_ADDR=$(NODE1_IP) /start_db.sh"
	docker exec nuodbpartitioning_node2_1 /bin/bash -c "DATABASE_NAME=$(DATABASE_NAME) BROKER_ALT_ADDR=$(NODE2_IP) /start_db.sh"


shell:
	docker exec -it nuodbpartitioning_node0_1

