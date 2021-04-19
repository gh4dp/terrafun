/*   
   As we are sing "aws" as a provider, we need to provide (1) the authentication details and (2) region.

   1: Authentication details:
	Since it is not advisable to publish :) such details for the rest of the world to see,
	we will keep this information into "my-secret-cred.tfvars" file, this file is already in .gitignore 
	so relax!

	We will supply reference to this file on the commandline.
*/

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {} 
variable "region" {}


provider "aws" {
  // https://registry.terraform.io/providers/hashicorp/aws/latest/docs
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region = var.region
}



// Now adding "aws" "instance" resource, we will refer to it as a "web" in this project.
resource "aws_instance" "web" {
  ami                    = "ami-0742b4e673072066f"
  instance_type          = "t2.micro"
  user_data              = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.allow-web.id]
  key_name = "msimpg"


  tags = {
    Name = random_pet.uniqueName.id
  }
}
