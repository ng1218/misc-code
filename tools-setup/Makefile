infra :
	git pull
	terraform init
	terraform apply -auto-approve

tools-setup:
	git pull
	ansible-playbook -i $(tool_name)-int.nareshdevops1218.online, -e ansible_user=azuser -e ansible_password=devops@12345 -e tool_name=$(tool_name) tools-setup.yml