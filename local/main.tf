# Configure the Rancher2 provider to admin
provider "rancher2" {
  api_url    = "https://node4.lan/v3"
  access_key = "token-t2ctf"
  secret_key = "6rjnbt74vmdc5z9c5b8r2z6zl4c6jhb948pq9kxdz6mg2gdqsj7nrd" 
  insecure = true
}

resource "rancher2_cluster_template" "tfdeploy" {
  name = "tfdeploy"
  members {
    access_type = "owner"
    user_principal_id = "local://user-mq956"
  }
  template_revisions {
    name = "V1"
    cluster_config {
      rke_config {
        network {
          plugin = "canal"
        }
        services {
          etcd {
            creation = "6h"
            retention = "24h"
          }
        }
      }
    }
    default = true
  }
  description = "Test cluster template v2"
}

# Create a new rancher2 RKE Cluster from template
resource "rancher2_cluster" "tfdeploy" {
  name = "tfdeploy"
  cluster_template_id = "${rancher2_cluster_template.tfdeploy.id}"
  cluster_template_revision_id = "${rancher2_cluster_template.tfdeploy.default_revision_id}"
#  cluster_registration_token = "${rancher2_cluster.tfdeploy.cluster_registration_token}"
}

