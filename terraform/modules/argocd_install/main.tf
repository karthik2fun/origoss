resource "helm_release" "argocd" {
  provider         = helm.this
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}

resource "kubernetes_manifest" "bootstrap_app" {
  provider = kubernetes.this
  manifest = yamldecode(file("${path.module}/../../../argocd/app-of-apps.yaml"))  # Points to your repo
}