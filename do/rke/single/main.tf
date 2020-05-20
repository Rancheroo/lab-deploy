# Create a single rke with all
resource "digitalocean_droplet" "single" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n1_name}"
  region   = "sgp1"
  size     = "s-4vcpu-8gb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    type         = "ssh"
    user         = "root"
    private_key  = "${file(var.pvt_key)}"
    timeout      = "2m"
    host         = digitalocean_droplet.single.ipv4_address 
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
    echo "s/singleADDRESS/${digitalocean_droplet.single.ipv4_address}/" > cluster.sed
    echo "s/singleNAME/${digitalocean_droplet.single.name}/" >> cluster.sed
    sed -i -f cluster.sed cluster.yml
    EOT
  }
}
