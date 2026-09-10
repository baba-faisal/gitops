terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

variable "db_name" {
  type = string
}

variable "db_password" {
  type = string
}

resource "docker_image" "postgres" {
  name = "postgres:14-alpine"
}

resource "docker_container" "db" {
  name         = var.db_name
  image        = docker_image.postgres.image_id
  network_mode = "kind"
  
  env = [
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_USER=postgres"
  ]
}
