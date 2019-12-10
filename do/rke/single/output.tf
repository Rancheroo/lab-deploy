#Generate Output of External and Internal Ip's

output "single_ip_output" {
  description = "IP addresses of single droplet"
  value       = digitalocean_droplet.single.ipv4_address
  }
