# Create a directory using PowerShell on Windows
resource "null_resource" "create_directory" {
  provisioner "local-exec" {
    command = "powershell.exe -Command \"New-Item -ItemType Directory -Path terraform_output -Force\""
  }
}

# Create a file with content inside the directory
resource "local_file" "message_file" {
  depends_on = [null_resource.create_directory]

  content  = "Hello from Terraform! This is a sample file."
  filename = "${path.module}\\terraform_output\\message.txt"
}

resource "local_file" "message_file1" {
  depends_on = [null_resource.create_directory]

  content  = "Hello from Terraform! This is a sample file. testing the file creation using terraform"
  filename = "${path.module}\\terraform_output\\message1.txt"
}

