

resource "helm_release" "anythingllm" {
  name             = "anythingllm"
  repository       = "https://la-cc.github.io/anything-llm-helm-chart"
  chart            = "anything-llm"
  namespace        = "anythingllm"
  create_namespace = true

  atomic           = false
  cleanup_on_fail  = true
  timeout          = 600

  # 👇 Add Ollama provider config
  set {
    name  = "config.LLM_PROVIDER"
    value = "ollama"
  }

  set {
    name  = "config.OLLAMA_BASE_URL"
    value = "http://ollama.anythingllm.svc.cluster.local:11434"
  }

  set {
    name  = "config.MODEL"
    value = "llama3"
  }

  set {
    name  = "chromadb.enabled"
    value = "false"
  }

  set {
    name  = "config.VECTOR_DB"
    value = "weaviate"
  }

  set {
    name  = "config.WEAVIATE_ENDPOINT"
    value = "http://weaviate.weaviate.svc.cluster.local:80"
  }

  set {
    name  = "config.ADMIN_EMAIL"
    value = "admin@example.com"
  }

  set {
    name  = "config.ADMIN_PASSWORD"
    value = "SuperSecurePassword123!"
  }

  set {
  name  = "config.ADMIN_SECRET_NAME"
  value = "anythingllm-admin"
  }
}
