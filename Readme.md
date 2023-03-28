
Steps to create the infrastructure required (EC2 + RDS + ALB + SG) :

1) After you have cloned the github repo (https://github.com/alpapone1/test-tornado.git) , you need to move to the folder "envs" and then you choose for which regionand which environment (dev/qa/prod) you want to create the infrastructure.
	
   Example : if you want to create the infrastructure in the region eu-central-1 for the dev env, you need to change folder by :
   
   cd envs/eu-central-1/dev

2) Check the variables.tf file if you need to modify some variable value before executing the terraform commands (especially if you copied the files from another folder)

3) Run the following commands :

   terraform init
   terraform plan
   terraform apply 

NOTE = the structure has been designed to re-use modules, so every time you need just to move to the region/env folder you want to spin up the infrastructure and modify the variables.tf file accordingly.


