module "app" {
  source         = "../../modules/app"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.small"
  env            = "homolog"
}

module "db" {
  source         = "../../modules/db"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.small"
  env            = "homolog"
}