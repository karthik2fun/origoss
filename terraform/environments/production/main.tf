module "gke" {
  source       = "../../modules/gke"
  env          = "test"
  machine_type = "e2-small"
  # Other vars
}

module "cloud_sql" {
  source      = "../../modules/cloud_sql"
  env         = "production"
  db_tier     = "db-f1-micro"
  db_password = var.db_password_test  # From secrets
}

module "argocd" {
  source = "../../modules/argocd_install"
  # Depends on GKE
  depends_on = [module.gke]
}