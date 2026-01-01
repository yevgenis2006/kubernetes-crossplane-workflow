
resource "kubernetes_ingress_v1" "anythingllm_ingress" {
  metadata {
    name      = "anythingllm-ingress"
    namespace = kubernetes_namespace.anythingllm.metadata[0].name

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/proxy-read-timeout"  = "600"
      "nginx.ingress.kubernetes.io/proxy-send-timeout"  = "600"
      "nginx.ingress.kubernetes.io/proxy-body-size"     = "50m"
    }
  }

  spec {
    rule {
      host = var.anythingllm_host

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "anything-llm"  # Helm service name
              port {
                number = 3001
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = [var.anythingllm_host]
      secret_name = var.anythingllm_tls_secret
    }
  }

  depends_on = [
    module.flowise
  ]
}
