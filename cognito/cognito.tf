resource "aws_cognito_user_pool" "user_pool" {
  name = "usuarios_fiap"

  # Definindo atributos do usuário
  alias_attributes        = ["email"]
  auto_verified_attributes = ["email"]

  # Configuração de verificação de email
  # email_verification_message = "Seu código de verificação é {####}."
  # email_verification_subject  = "Confirmação de email"

  # Configurações de segurança
    password_policy {
      minimum_length                = 6
      require_uppercase             = false
      require_lowercase             = false
      require_numbers               = false
      require_symbols               = false
      temporary_password_validity_days = 7
    }

  # Configuração de atributos
  schema {
    name     = "email"
    attribute_data_type = "String"
    required = true
    mutable  = true
  }

  schema {
    name                     = "lgpd"
    attribute_data_type      = "String"
    mutable                  = true
    required                 = false
  }

  # Limitar as configurações de recursos
  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = "usuarios_fiap_client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = false
  explicit_auth_flows = ["ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]

  # allowed_oauth_flows_user_pool_client = true 
  # allowed_oauth_flows               = ["code", "implicit"] 
  # allowed_oauth_scopes              = ["email", "openid", "profile", "aws.cognito.signin.user.admin"]

  read_attributes = ["email", "custom:lgpd"]
  write_attributes = ["email", "custom:lgpd"]

  # callback_urls = [
  #   "https://localhost:3000"
  # ]
  # logout_urls = [
  #   "https://localhost:3000"
  # ]
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain      = "example-user-pool-domain" 
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user" "example_user" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "34182012020"
  attributes = {
    email        = "edsontecno@gmail.com"
    phone_number = "+55619812345667"
    email_verified  = "true"
    lgpd = "true"
  }
  lifecycle {
    ignore_changes = [attributes["email_verified"]]
  }
  password      = "12345678!"
  force_alias_creation    = false
  message_action          = "SUPPRESS"
  desired_delivery_mediums = ["EMAIL"]
}

output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}
