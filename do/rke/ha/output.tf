#Generate Output of External and Internal Ip's

output "ha1_ip_output" {
  description = "IP addresses of HA1 droplet"
  value       = data.digitalocean_droplet.ha1.ipv4_address
  }

output "ha2_ip_output" { 
  description = "IP addresses of ha2 droplet"
  value       = data.digitalocean_droplet.ha2.ipv4_address
  }

output "ha3_ip_output" {
  description = "IP addresses of ha3 droplet"
  value       = data.digitalocean_droplet.ha3.ipv4_address
  }

output "ha4_ip_output" {
  description = "IP addresses of ha4 droplet"
  value       = data.digitalocean_droplet.ha4.ipv4_address
 }
