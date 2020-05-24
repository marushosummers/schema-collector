build:
	@read -p "Where is your SSH key for GitHub? (ex: ~/.ssh/id_rsa): " ssh_key; \
	eval ssh_key=`echo $$ssh_key`; \
	echo "Reading $$ssh_key"; \
	cat "$$ssh_key" >> /dev/null && docker-compose build --build-arg SSH_PRIVATE_KEY="`cat $$ssh_key`"
run:
	docker-compose up
stop:
	docker-compose down -v