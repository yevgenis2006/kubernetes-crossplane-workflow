
resource "kubernetes_manifest" "provider_k8s" {
  manifest = {
    apiVersion = "pkg.crossplane.io/v1"
    kind       = "Provider"
    metadata = {
      name = "provider-k8s"
    }
    spec = {
      package = "crossplane/provider-kubernetes:master"
    }
  }
  depends_on = [helm_release.crossplane]
}

resource "kubernetes_manifest" "providerconfig_local" {
  manifest = {
    apiVersion = "kubernetes.crossplane.io/v1alpha1"
    kind       = "ProviderConfig"
    metadata = {
      name = "local-k8s"
    }
    spec = {
      kubeconfig = {}  # empty = in-cluster
    }
  }
  depends_on = [kubernetes_manifest.provider_k8s]
}

resource "kubernetes_manifest" "demo_namespace" {
  manifest = {
    apiVersion = "kubernetes.crossplane.io/v1alpha1"
    kind       = "Object"
    metadata = {
      name = "demo-namespace"
    }
    spec = {
      forProvider = {
        apiVersion = "v1"
        kind       = "Namespace"
        metadata = {
          name = "demo-namespace"
        }
      }
      providerConfigRef = {
        name = "local-k8s"
      }
    }
  }
  depends_on = [kubernetes_manifest.providerconfig_local]
}

resource "kubernetes_manifest" "nginx_deployment" {
  manifest = {
    apiVersion = "kubernetes.crossplane.io/v1alpha1"
    kind       = "Object"
    metadata = {
      name = "nginx-deployment"
    }
    spec = {
      forProvider = {
        apiVersion = "apps/v1"
        kind       = "Deployment"
        metadata = {
          name      = "nginx-demo"
          namespace = "demo-namespace"
        }
        spec = {
          replicas = 2
          selector = {
            matchLabels = { app = "nginx" }
          }
          template = {
            metadata = { labels = { app = "nginx" } }
            spec = {
              containers = [
                {
                  name  = "nginx"
                  image = "nginx:latest"
                  ports = [{ containerPort = 80 }]
                }
              ]
            }
          }
        }
      }
      providerConfigRef = { name = "local-k8s" }
    }
  }
  depends_on = [kubernetes_manifest.demo_namespace]
}

resource "kubernetes_manifest" "nginx_service" {
  manifest = {
    apiVersion = "kubernetes.crossplane.io/v1alpha1"
    kind       = "Object"
    metadata = {
      name = "nginx-service"
    }
    spec = {
      forProvider = {
        apiVersion = "v1"
        kind       = "Service"
        metadata = {
          name      = "nginx-svc"
          namespace = "demo-namespace"
        }
        spec = {
          selector = { app = "nginx" }
          ports = [{ protocol = "TCP", port = 8080, targetPort = 8080 }]
        }
      }
      providerConfigRef = { name = "local-k8s" }
    }
  }
  depends_on = [kubernetes_manifest.nginx_deployment]
}
