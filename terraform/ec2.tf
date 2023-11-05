resource "aws_instance" "node1" {
  ami                         = "ami-05c13eab67c5d8861"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public_a.id
  key_name                    = "test-lab"
  vpc_security_group_ids      = ["sg-055dd40d3baab49f9"]
  associate_public_ip_address = true

user_data = <<-EOF
    #!/bin/bash
    echo "Seu script aqui"
    # Mais comandos
    EOF
  tags = {
    Name = "ec2_instance_az-a"
  }
}
resource "aws_instance" "node2" {
  ami                         = "ami-05c13eab67c5d8861"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public_b.id
  key_name                    = "test-lab"
  vpc_security_group_ids      = ["sg-055dd40d3baab49f9"]
  associate_public_ip_address = true

  tags = {
    Name = "ec2_instance_az-b"
  }
}

