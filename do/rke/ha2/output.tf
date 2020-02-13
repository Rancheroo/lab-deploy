#Generate Output of External and Internal Ip's

output "hb1_ip_output" {
  description = "IP addresses of HA1 droplet"
  value       = digitalocean_droplet.hb1.ipv4_address
  }

output "hb2_ip_output" { 
  description = "IP addresses of hb2 droplet"
  value       = digitalocean_droplet.hb2.ipv4_address
  }

output "hb3_ip_output" {
  description = "IP addresses of hb3 droplet"
  value       = digitalocean_droplet.hb3.ipv4_address
  }

output "hb4_ip_output" {
  description = "IP addresses of hb4 droplet"
  value       = digitalocean_droplet.hb4.ipv4_address
 }
