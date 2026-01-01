<img width="967" height="469" alt="image" src="https://github.com/user-attachments/assets/77b1ca16-7e4b-4b4b-a74e-e45ff8179dbb" />


## Crossplane | AWS - GCP - Azure
Crossplane is an open-source cloud infrastructure control plane that lets you provision and manage cloud resources using Kubernetes APIs.


🧱  Key Features and Purpose
```
✔ Connectivity and Interoperability:
Agentgateway connects different components of an AI system, including agents, tools (like OpenAPI endpoints), and LLM providers, in a scalable and secure way. It supports emerging AI protocols such as the Agent-to-Agent (A2A) and Model Context Protocol (MCP).
✔ Security and Governance: It offers robust security features, including JWT authentication, external authorization policies (e.g., via Open Policy Agent), and API key management for LLM providers. This helps prevent data leaks and tool poisoning attacks.
✔ Observability: The platform includes built-in metrics and tracing capabilities, providing visibility into agent and tool interactions.
✔ Deployment Flexibility: Agentgateway can be deployed as a standalone binary or in a Kubernetes environment using the kgateway project, which offers native support for the Kubernetes Gateway API.
✔ Dynamic Configuration: It supports dynamic configuration updates via an xDS interface without requiring system downtime.
```



🚀 Deployment Options
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```

