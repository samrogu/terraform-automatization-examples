build {
  sources = ["source.amazon-ebs.linux"]

  #provisioner "shell" {
  #  scripts = [
  #    "files/init.sh",
  #  ]
  #}

  provisioner "ansible" {
      playbook_file = "./playbook.yml"
    }

}