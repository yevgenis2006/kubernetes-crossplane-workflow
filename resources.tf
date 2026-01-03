
###  ---  Default Template  ---  ###
module "minio" {
  source = "./modules/minio"
   depends_on = [kubernetes_namespace.anythingllm]
}

module "crossplane" {
  source = "./modules/crossplane"
  depends_on = [module.minio]
}
