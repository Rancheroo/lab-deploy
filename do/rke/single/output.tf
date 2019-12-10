#Generate Output of External and Internal Ip's

output "ha1_ip_output" {
  description = "IP addresses of HA1 droplet"
  value       = digitalocean_droplet.ha1.ipv4_address
  }
