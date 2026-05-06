resource "aws_instance" "app" {
#   ami           = var.ami
#   instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user

              docker run -d -p 80:80 nginx
              docker run -d -p 81:80 nginx
              docker run -d -p 82:80 nginx
              EOF

  tags = {
    # Name = "${var.env}-app"
  }
}