resource "google_sql_database_instance" "db" {
  name             = "${var.env}-mysql"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = var.db_tier  # e.g., db-f1-micro for test
    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled = true
    }
  }
}

resource "google_sql_database" "ghost_db" {
  name     = "ghost"
  instance = google_sql_database_instance.db.name
}

resource "google_sql_user" "ghost_user" {
  name     = "ghost"
  instance = google_sql_database_instance.db.name
  password = var.db_password  # Use random or secret manager
}