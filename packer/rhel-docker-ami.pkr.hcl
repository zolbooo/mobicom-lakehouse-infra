packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "rhel-docker" {
  ami_name      = "rhel-docker-ami"
  instance_type = "t2.micro"
  region        = "ap-southeast-1"
  source_ami_filter {
    filters = {
      name                = "RHEL-9.5*-x86_64-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["309956199498"]
  }
  ssh_username = "ec2-user"
}

build {
  name = "rhel-docker-ami"
  sources = [
    "source.amazon-ebs.rhel-docker"
  ]

  # See: https://docs.docker.com/engine/install/rhel/
  provisioner "shell" {
    inline = [
      "sudo dnf -y install dnf-plugins-core",
      "sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo",
      "sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
      "sudo systemctl enable --now docker"
    ]
  }
  provisioner "shell" {
    inline = [
      "sudo dnf update -y"
    ]
  }
}
