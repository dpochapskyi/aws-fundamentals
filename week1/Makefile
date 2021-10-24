STACK_NAME := week1-scale-group

create:
	aws cloudformation create-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://template.yaml

delete:
	aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}
