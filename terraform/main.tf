provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-05fa00d4c63e32376" # Ubuntu 20.04 LTS in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "jenkins-managed-ec2"
  }
}
