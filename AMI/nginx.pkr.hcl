
build {
  sources = ["source.amazon-ebs.terraform-web-prj-19-nginx"]

  provisioner "shell" {
    script = "nginx.sh"
  }
}
