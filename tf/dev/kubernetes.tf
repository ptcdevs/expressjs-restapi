data kubernetes_namespace dev {
  provider = kubernetes.ptcdevs
  metadata {
    name = "dev"
  }
}

resource kubernetes_secret ghcr-secret {
  provider = kubernetes.ptcdevs
  metadata {
    name      = "expressjs-restapi-ghcr-secret"
    namespace = data.kubernetes_namespace.dev.metadata[0].name
  }
  type = "kubernetes.io/dockercfg"
  data = {
    ".dockercfg" = jsonencode(local.ghcrcreds)
  }
}
