resource "aws_security_group" "server" {
  name = "${var.role}${var.id}-${var.namestamp}-ports"
  ingress {
    from_port = 26656
    protocol = "tcp"
    to_port = 26656
    cidr_blocks = ["0.0.0.0/0"]
    description = "Tendermint P2P port"
  }

  ingress {
    from_port = 26657
    protocol = "tcp"
    to_port = 26657
    cidr_blocks = ["0.0.0.0/0"]
    description = "Tendermint RPC port"
  }

  ingress {
    from_port = 26660
    protocol = "tcp"
    to_port = 26660
    cidr_blocks = ["${var.nightking_public_ip}/32", "${var.nightking_private_ip}/32"]
    description = "Tendermint Prometheus port"
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.nightking_public_ip}/32", "${var.nightking_private_ip}/32"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
