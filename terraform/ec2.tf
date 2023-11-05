resource "aws_instance" "node1" {
  ami                         = "ami-05c13eab67c5d8861"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public_a.id
  key_name                    = "test-lab"
  security_groups             = [aws_security_group.swarm.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    echo "Seu script aqui"
    # Mais comandos
    EOF
  tags = {
    Name = "ec2_instance_az-a"
  }
  depends_on = [aws_security_group.swarm]
}
resource "aws_instance" "node2" {
  ami                         = "ami-05c13eab67c5d8861"
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public_b.id
  key_name                    = "test-lab"
  security_groups             = [aws_security_group.swarm.id]
  associate_public_ip_address = true

  tags = {
    Name = "ec2_instance_az-b"
  }
  depends_on = [aws_security_group.swarm]
}

