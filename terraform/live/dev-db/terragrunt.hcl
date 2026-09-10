terraform { source = "../../modules/local-postgres" }
inputs = { db_name = "my-external-database", db_password = "super-secret-password-123" }
