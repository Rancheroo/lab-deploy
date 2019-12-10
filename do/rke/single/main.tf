# Create a single rke with all
resource "digitalocean_droplet" "ha1" {
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
    host         = digitalocean_droplet.ha1.ipv4_address 
  }
  provisioner "remote-exec" {
    script = "pre-reqs.sh" 
  }
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = <<EOT
    rm -f cluster.yml cluster.rkestate
    cp cluster.yml.source cluster.yml.tmp
    echo "s/HA1ADDRESS/${digitalocean_droplet.ha1.ipv4_address}/" > cluster.sed
    echo "s/HA1NAME/${digitalocean_droplet.ha1.name}/" >> cluster.sed
    sed -i cluster.yml.tmp -f cluster.sed cluster.yml
    rm cluster.yml.tmp
    EOT
  }
}
