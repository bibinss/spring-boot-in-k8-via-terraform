output "lb_ip" {
  value = "${kubernetes_service.hello_world.metadata.0.name}"
}