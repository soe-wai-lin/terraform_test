provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami	= "ami-003c463c8207b4dfa"
  instance_type	= "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
	      echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF

  user_data_replace_on_change = true
  
  tags = {
    Name = "terraform-example"
  }
}
