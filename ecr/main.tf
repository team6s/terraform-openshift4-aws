data "aws_ecr_authorization_token" "token" {
}

output "ecr_token" {
  value = data.aws_ecr_authorization_token.token
  sensitive = true
}
output "ecr_token2" {
  value = local.ecr_token
  sensitive = true
}

locals {
  ecr_token = base64encode("${data.aws_ecr_authorization_token.token.user_name}:${data.aws_ecr_authorization_token.token.password}")
}