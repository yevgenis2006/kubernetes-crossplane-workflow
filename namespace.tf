
resource "kubernetes_namespace" "crossplane_system" {
metadata {
name = "crossplane-system"
labels = {
"app.kubernetes.io/managed-by" = "terraform"
  }
 }
}
