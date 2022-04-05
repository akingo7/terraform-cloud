
build {
  sources = ["source.amazon-ebs.terraform-web-prj-19-bastion"]

  provisioner "shell" {
    script = "bastion.sh"
  }
}