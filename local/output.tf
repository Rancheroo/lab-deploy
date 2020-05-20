# Generate custom command

output "custom_cluster_command" {
   description = "custom cluster command"
   value       = rancher2_cluster.tfdeploy.cluster_registration_token
   }

