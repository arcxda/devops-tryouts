resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c94855ba95c71c99"  # ID de Amazon Linux 2 en la región deseada
  instance_type = "t3a.micro"
  
  tags = {
    Name = "mi-instancia-ec2"
  }
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.ec2_instance.availability_zone
  size              = 30
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2_instance.id
}

