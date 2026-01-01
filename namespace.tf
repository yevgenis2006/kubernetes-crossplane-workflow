
resource "kubernetes_namespace" "crossplane" {
metadata {
name = "crossplane"
labels = {
"app.kubernetes.io/managed-by" = "terraform"
  }
 }
}
