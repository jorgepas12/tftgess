# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn = "arn:aws:iam::472867741616:role/TerraTGRole"
        session_name = "terra-session"
        external_id  = "93734a9282-e21d-2c35-b293-029283840199"
    }
}
