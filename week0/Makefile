STACK_NAME := week0-instance

create:
	aws cloudformation create-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://template.yaml

delete:
	aws cloudformation delete-stack \
		--stack-name ${STACK_NAME}

get-pub-ip:
	aws cloudformation describe-stacks \
		--stack-name ${STACK_NAME} \
		--query "Stacks[0].Outputs[?OutputKey=='PublicIP'].OutputValue" \
		--output text
