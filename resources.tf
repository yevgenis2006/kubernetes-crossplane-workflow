

###  ---  Default Template  ---  ###
module "minio" {
  source = "./modules/minio"
   depends_on = [kubernetes_namespace.anythingllm]
}

module "ollama" {
  source = "./modules/ollama"
  depends_on = [module.minio]
}

module "weaviate" {
  source = "./modules/weaviate"
  depends_on = [module.minio]
}

module "anythingllm" {
  source = "./modules/anythingllm"
  depends_on = [module.weaviate]
}

module "flowise" {
  source = "./modules/flowise"
  depends_on = [module.anythingllm]
}
