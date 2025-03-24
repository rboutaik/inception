
# Copy a folder from host to vm
# scp -r ~/Documents/myfolder username@192.168.1.100:/home/username/target_folder



all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -rf /home/rboutaik/data/mariadb
	sudo rm -rf /home/rboutaik/data/wordpress

re: fclean all