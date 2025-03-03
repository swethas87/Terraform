resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
 
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow_tls"
    CreatedBy = "Swetha"
  }
}

resource "aws_instance" "db"{
    ami = "ami-031d574cddc5bb371"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] 
    instance_type = "t3.micro"
    
    tags ={
        Name = "DB"
}
}