# Latest Ubuntu 22.04 LTS AMI ကို အလိုအလျောက် ရှာရန်
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical ID
}

# EC2 Instance Creation
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  #Bash script to install Nginx on the EC2 instance
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to Exxon Platform Engineering - Deployed via GitOps</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "Exxon-Web-Server"
    Environment = "Production"
  }
}