# Create a three node cluster
resource "digitalocean_droplet" "ha1" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n1_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
	ssh_keys = [
		"${var.ssh_fingerprint}"
	]
  }

resource "digitalocean_droplet" "ha2" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n2_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
	ssh_keys = [
		"${var.ssh_fingerprint}"
	]
  }
 
resource "digitalocean_droplet" "ha3" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n3_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
	ssh_keys = [
		"${var.ssh_fingerprint}"
	]
	 }
	 
resource "digitalocean_droplet" "ha4" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.n4_name}"
  region   = "sgp1"
  size     = "s-2vcpu-4gb"
	ssh_keys = [
		"${var.ssh_fingerprint}"
	]
  }


# provisioners "local-exec" {

