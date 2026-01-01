
variable "kubeconfig_path" {
  type        = string
  description = "Path to kubeconfig for the target cluster"
  default     = "~/.kube/config"
}

variable "anythingllm_host" {
  description = "Public hostname for AnythingLLM"
  type        = string
  default     = "llm.appflex.io"
}

variable "anythingllm_service_name" {
  description = "Public hostname for AnythingLLM"
  type        = string
  default     = "anything-llm"
}

variable "anythingllm_service_port" {
  description = "Public hostname for AnythingLLM"
  type        = string
  default     = "3001"
}

variable "anythingllm_tls_secret" {
  description = "TLS secret name"
  type        = string
  default     = "appflex"
}

