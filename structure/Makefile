dev:
	rm -f .terraform/terraform.tfvars
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/input.tfvars
prod:
	rm -f .terraform/terraform.tfvars
	terraform init -backend-config=env-prod/state.tfvars
	terraform apply -auto-approve -var-file=env-prod/input.tfvars