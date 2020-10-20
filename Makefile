init: check-var-env
	rm -rf ./.terraform
	terraform init -backend=true -backend-config=./env/$(env)/backend.tfvars

plan: init
	terraform plan --var-file=./env/$(env)/terraform.tfvars

apply: init
	terraform apply --var-file=./env/$(env)/terraform.tfvars

destroy: init
	terraform destroy --var-file=./env/$(env)/terraform.tfvars

check-var-%:
	@ if [ "${${*}}" = "" ]; then echo "environment variable '$*' not set"; exit 1; fi
