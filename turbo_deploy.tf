module "turbo_deploy" {
  providers = {
    aws = aws
  }
  source            = "github.com/frgrisk/terraform-aws-turbo-deploy?ref=042687d"
  s3_tf_bucket_name = "turbo-deploy-hskiba"
}

output "turbo_deploy_base_url" {
  value = module.turbo_deploy.base_url
}
