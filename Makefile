.PHONY: fmt init plan apply

fmt:
	@terraform -chdir=terraform fmt

init:
	@terraform -chdir=terraform init

plan: init
	@terraform -chdir=terraform plan

apply: init
	@terraform -chdir=terraform apply
