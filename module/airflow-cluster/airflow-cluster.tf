resource "aws_instance" "jf-test" {
  instance_type     = "t2.micro"
  availability_zone = "eu-west-1a"
  ami               = "ami-099a8245f5daa82bf"

  tags = var.tags

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}
