init: check-var-env
	rm -rf ./.terraform
	terraform init -backend=true -backend-config=./env/$(env)/backend.tfvars

plan: init
	@echo "*******************************************"
	@echo "* ACTION:		PLAN"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE:		$(AWS_PROFILE)"
	@echo "*******************************************"
	terraform plan --var-file=./env/$(env)/terraform.tfvars

apply: init
	@echo "*******************************************"
	@echo "* ACTION:		APPLY"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE		$(AWS_PROFILE)"
	@echo "*******************************************"
	terraform apply --var-file=./env/$(env)/terraform.tfvars

destroy: init
	@echo "*******************************************"
	@echo "* ACTION:		DESTROY"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE		$(AWS_PROFILE)"
	@echo "*******************************************"
	terraform destroy --var-file=./env/$(env)/terraform.tfvars

plan-module: check-var-module
	@echo "*******************************************"
	@echo "* ACTION:		PLAN"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE		$(AWS_PROFILE)"
	@echo "* MODULE:		$(module)"
	@echo "*******************************************"
	cd ./test/$(module) && \
		rm -rf ./.terraform && \
		terraform init -backend=true -backend-config=../../env/$(env)/backend.tfvars && \
		terraform plan

apply-module: check-var-module
	@echo "*******************************************"
	@echo "* ACTION:		APPLY"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE		$(AWS_PROFILE)"
	@echo "* MODULE:		$(module)"
	@echo "*******************************************"
	cd ./test/$(module) && \
		rm -rf ./.terraform && \
		terraform init -backend=true -backend-config=../../env/$(env)/backend.tfvars && \
		terraform apply

destroy-module: check-var-module
	@echo "*******************************************"
	@echo "* ACTION:		DESTROY"
	@echo "* ENV:			$(env)"
	@echo "* PROFILE		$(AWS_PROFILE)"
	@echo "* MODULE:		$(module)"
	@echo "*******************************************"
	cd ./test/$(module) && \
		rm -rf ./.terraform && \
		terraform init -backend=true -backend-config=../../env/$(env)/backend.tfvars && \
		terraform destroy

check-var-%:
	@ if [ "${${*}}" = "" ]; then echo "environment variable '$*' not set"; exit 1; fi
