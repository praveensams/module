resource "aws_network_interface" "foo" {
  subnet_id   = var.subnet

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-02354e95b39ca8dec" # us-west-2
  instance_type = "t2.micro"
  key_name = var.keypair
  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  security_groups = var.security
}
