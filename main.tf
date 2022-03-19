provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "mytest" {
  ami = "ami-0b0af3577fe5e3532"
  instance_type = "t2.micro"

  tags = {
      Name = "Db Server"
  }
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags ={
        Name = "testvpc"
    }
  
}

resource "aws_security_group" "mysg" {
    name = "Allow HTTPS Traffic"
ingress {
    from_port = "443"
    to_port = "443"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    from_port        = "443"
    to_port          = "443"
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
    Name = "testsg"
}
}    
 
  

