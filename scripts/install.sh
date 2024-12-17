#!/bin/bash
CONFIG_FILE="$1"

# Check if first param not exist, and will auto fill it with k8s.conf
if ! [[ -n "$1" ]]; then
  CONFIG_FILE="es.conf"
fi

check_file() {
  if [[ ! -f "$1" ]]; then
    echo "Error: File \"${1}\" does not exist."
    exit 1
  fi
}

check_file $CONFIG_FILE
source "$CONFIG_FILE"

check_file .library
source .library

# sudo apt update -y
# sudo apt install -y libarchive-zip-perl default-jdk
gen_cert_efk

prep_hosts_list
make_hosts_list "lb" $lb_hostname
make_hosts_list "es" $es_hostname
make_hosts_list "kf" $kf_hostname
make_hosts_list "ea" $ea_hostname

prepare_nft "lb"
prepare_nft "es"
prepare_nft "kf"
prepare_nft "ea"

prep_lb_config
gen_lb_config "9200" "elasticsearch" $es_hostname
gen_lb_config "443:5601" "kibana" $kf_hostname
gen_lb_config "8220" "fleet" $kf_hostname

prep_installer
cd .. && \
ansible-playbook playbooks/deploy_efk.yml
