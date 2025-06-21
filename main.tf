terraform {
  # Configuration simplifiée sans Terraform Cloud
}

provider "aws" {
  region = "us-west-2"
  # Le profil sera automatiquement récupéré depuis ~/.aws/credentials
}

# Appel du module personnalisé hello_world
module "hello_world" {
  #source = "./modules/hello_world"
  source = "git::https://github.com/fredericmalo/tf_hello_world/"

  # Variables à passer au module
  bucket_name_prefix = "terraform-hello-world"
  environment        = "dev"
  secret_token       = "ghp_1234567890abcdef1234567890abcdef1234"
  tags = {
    Project     = "Terraform Demo"
    Department  = "DevOps"
    ManagedBy   = "Terraform"
  }
}

# Outputs du module
output "hello_world_bucket_name" {
  value       = module.hello_world.bucket_name
  description = "Nom du bucket S3 créé par le module hello_world"
}

output "hello_world_bucket_region" {
  value       = module.hello_world.bucket_region
  description = "Région du bucket S3 créé par le module hello_world"
}
