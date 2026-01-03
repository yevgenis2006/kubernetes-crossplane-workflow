
###  ---  Default Template  ---  ###
module "minio" {
  source = "./modules/minio"
  depends_on = [kubernetes_namespace.crossplane-system]
}

module "crossplane" {
  source = "./modules/crossplane"
  depends_on = [module.minio]
}
