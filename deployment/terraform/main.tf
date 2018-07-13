resource "kubernetes_namespace" "sample" {
  metadata {
    annotations {
      name = "example-annotation"
    }

    labels {
      mylabel = "sample"
    }

    name = "sample-namespace"
  }
}

resource "kubernetes_replication_controller" "hello_world" {
  metadata {
    name = "scalable-hello-world-example"
    #namespace = "${kubernetes_namespace.sample.metadata.0.name}"
    labels {
      App = "HelloWorldExample"
    }
  }

  spec {
    selector {
      App = "HelloWorldExample"
    }
    template {
      container {
        image = "bibindev/spring-boot-in-k8-via-terraform:latest"
        name  = "sample"

        port {
          container_port = 8080
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_world" {
  metadata {
    name = "hello-world-service-example"
    #namespace = "${kubernetes_namespace.sample.metadata.0.name}"
  }
  spec {
    selector {
      App = "${kubernetes_replication_controller.hello_world.metadata.0.labels.App}"
    }
    port {
      name = "http"
      port = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}