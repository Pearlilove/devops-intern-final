
variable "image" {
  type    = string
  default = "ghcr.io/pearlilove/devops-intern-final:latest"
}

job "nginx-app" {
  datacenters = ["dc1"]
  type        = "service"

  group "nginx" {
  count          = 1
  shutdown_delay = "5s"

    network {
      port "http" {
        to = 8080
      }
    }

    service {
      name = "nginx-app"
      port = "http"

      check {
        name     = "nginx-http-health"
        type     = "http"
        path     = "/healthz"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = var.image
        ports = ["http"]
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }

    restart {
      attempts = 3
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    reschedule {
      attempts       = 3
      interval       = "1h"
      delay          = "30s"
      delay_function = "exponential"
      max_delay      = "10m"
      unlimited      = false
    }

    update {
      max_parallel      = 1
      min_healthy_time  = "10s"
      healthy_deadline  = "2m"
      auto_revert       = true
    }
  }
}
