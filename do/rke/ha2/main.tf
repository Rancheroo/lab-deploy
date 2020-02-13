# Create a three node cluster
resource "digitalocean_droplet" "hb1" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n1_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    type         = "ssh"
    user         = "root"
    private_key  = "${file(var.pvt_key)}"
    timeout      = "2m"
    host         = digitalocean_droplet.hb1.ipv4_address 
  }
  provisioner "remote-exec" {
    script = "pre-reqs.sh" 
  }
}

resource "digitalocean_droplet" "hb2" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n2_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    type         = "ssh"
    user         = "root"
    private_key  = "${file(var.pvt_key)}"
    timeout      = "2m"
    host         = digitalocean_droplet.hb2.ipv4_address 
  }
  provisioner "remote-exec" {
    script = "pre-reqs.sh" 
  }
}
 
resource "digitalocean_droplet" "hb3" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n3_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    type         = "ssh"
    user         = "root"
    private_key  = "${file(var.pvt_key)}"
    timeout      = "2m"
    host         = digitalocean_droplet.hb3.ipv4_address 
  }
  provisioner "remote-exec" {
    script = "pre-reqs.sh" 
  }
}
	 
resource "digitalocean_droplet" "hb4" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n4_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    type         = "ssh"
    user         = "root"
    private_key  = "${file(var.pvt_key)}"
    timeout      = "2m"
    host         = digitalocean_droplet.hb4.ipv4_address 
  }
  provisioner "remote-exec" {
    script = "pre-reqs.sh" 
  }
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = <<EOT
    rm -f cluster.yml cluster.rkestate
    cp cluster.yml.source cluster.yml
    echo "s/HA1ADDRESS/${digitalocean_droplet.hb1.ipv4_address}/" > cluster.sed
    echo "s/HA1NAME/${digitalocean_droplet.hb1.name}/" >> cluster.sed
    echo "s/HA2ADDRESS/${digitalocean_droplet.hb2.ipv4_address}/" >> cluster.sed
    echo "s/HA2NAME/${digitalocean_droplet.hb2.name}/" >> cluster.sed
    echo "s/HA3ADDRESS/${digitalocean_droplet.hb3.ipv4_address}/" >> cluster.sed
    echo "s/HA3NAME/${digitalocean_droplet.hb3.name}/" >> cluster.sed
    echo "s/HA4ADDRESS/${digitalocean_droplet.hb4.ipv4_address}/" >> cluster.sed
    echo "s/HA4NAME/${digitalocean_droplet.hb4.name}/" >> cluster.sed
    sed -i cluster.yml.bak -f cluster.sed cluster.yml
    EOT
  }
}

# resource "null_resource" "null_id" {
#   provisioner "local-exec" {
# 		command = sed -i .bak -f cluster.sed cluster.yml
# 	}
# }
