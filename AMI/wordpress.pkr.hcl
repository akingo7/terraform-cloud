
build {
  sources = ["source.amazon-ebs.terraform-web-prj-19-wordpress"]

  provisioner "shell" {
    script = "wordpress.sh"
  }
}