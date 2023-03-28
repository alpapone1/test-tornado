output "ip" {
  value = "${aws_instance.app_server.public_ip}"
}

output "lb_address" {
  value = "${aws_alb.alb.dns_name}"
}