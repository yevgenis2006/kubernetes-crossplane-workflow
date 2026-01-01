

resource "kubernetes_namespace" "anythingllm" {
metadata {
name = "anythingllm"
labels = {
"app.kubernetes.io/managed-by" = "terraform"
  }
 }
}
