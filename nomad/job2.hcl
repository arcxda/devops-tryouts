job "mi-job-service" {
  type        = "service"

  group "mi-grupo" {
    count = 1
    network {
      port "web" {
        static = 5000
      }
     }

    task "task1" {
      driver = "docker"

      config {
        image = "arcdev1/devops-tryouts"
      }

      resources {
        cpu    = 500
        memory = 256
      }

      service {
        name = "mi-servicio-task1"
        port = "web"
      }
    }

    task "task2" {
      driver = "docker"

      config {
        image = "arcdev1/devops-tryouts"
      }

      resources {
        cpu    = 500
        memory = 256
      }

      service {
        name = "mi-servicio-task2"
        port = "web"
      }
    }
  }
}

