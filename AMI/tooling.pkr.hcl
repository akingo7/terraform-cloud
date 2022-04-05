
build {
  sources = ["source.amazon-ebs.terraform-web-prj-19-tooling"]

  provisioner "shell" {
    script = "tooling.sh"
  }
}