# Check and install modules
for module in br_netfilter ip6_udp_tunnel ip_set ip_set_hash_ip ip_set_hash_net iptable_filter iptable_nat iptable_mangle iptable_raw nf_conntrack_netlink nf_conntrack nf_conntrack_ipv4   nf_defrag_ipv4 nf_nat nf_nat_ipv4 nf_nat_masquerade_ipv4 nfnetlink udp_tunnel veth vxlan x_tables xt_addrtype xt_conntrack xt_comment xt_mark xt_multiport xt_nat xt_recent xt_set  xt_statistic xt_tcpudp;
do
  if ! lsmod | grep -q $module; then
    modprobe $module;
    sed -i "$ a #added by rke pre-reqs.sh on $(date -I)" /etc/modules-load.d/modules.conf
    sed -i "$ a $module " /etc/modules-load.d/modules.conf
  fi;
done

# Check for ip forward and net bridge. if doesn't exist add and load into memory
if egrep -q ^net.ipv4.ip_forward=1 /etc/sysctl.conf > /dev/null; then
  echo "EXISTS - net.ipv4.ip_forward=1"
else
  sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
  sysctl -f /etc/sysctl.conf
  echo "ENABLED - net.ipv4.ip_forward=1"
fi

if egrep -q ^net.bridge.bridge-nf-call-iptables=1 /etc/sysctl.conf >/dev/null; then
  echo "EXISTS - net.bridge.bridge-nf-call-iptables=1"
else
  sed -i '$ a net.bridge.bridge-nf-call-iptables=1' /etc/sysctl.conf
  sysctl -f /etc/sysctl.conf
  echo "ADDED/ENABLED - net.bridge.bridge-nf-call-iptables=1"
fi

# Install Docker
if docker version --format '{{.Server.Version}}'; then
  echo "EXISTS - Docker allready installed"
else
  curl https://releases.rancher.com/install-docker/18.09.2.sh | sh;
  apt-mark hold docker-ce
fi
