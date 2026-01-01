
resource "helm_release" "ollama" {
  name       = "ollama"
  repository = "https://otwld.github.io/ollama-helm/"
  chart      = "ollama"
  namespace  = "anythingllm"

  timeout = 900

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "service.port"
    value = "11434"
  }

  set {
    name  = "resources.requests.cpu"
    value = "2"
  }

  set {
    name  = "resources.requests.memory"
    value = "4Gi"
  }

  set {
    name  = "ollama.pullModels[0]"
    value = "llama3.1:8b"
  }

  set {
    name  = "ollama.pullModels[1]"
    value = "nomic-embed-text"
  }
}
