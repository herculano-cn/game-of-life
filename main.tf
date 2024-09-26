provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "RailsAppInstance"
  }

  # Config server with user_data
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 80:3000 <game_of_life>
              EOF
}

output "instance_ip" {
  value = aws_instance.app_instance.public_ip
}
