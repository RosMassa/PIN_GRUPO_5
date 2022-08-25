project_id            = "pin2022"
credentials_file_path = "/path/to/my/credentials.json"
region                = "northamerica-northeast1"
zone                  = "northamerica-northeast1-c"

primary_ip_cidr          = "192.168.0.0/26" # max node IPs = 64 (max nodes = 60; 4 IPs reservered in every VPC)
max_pods_per_node        = "32"             # max pods per node <= half of max node IPs
cluster_ipv4_cidr_block  = "10.0.0.0/18"    # max pod IPs = 15360 (60 * 256), CIDR must be able to cover for all the potential IPs
services_ipv4_cidr_block = "10.1.0.0/20"

channel      = "REGULAR"
auto_upgrade = "true"

gke_cluster_name             = "pin-devops"
dataplane_v2_enabled         = "false"
filestore_csi_driver_enabled = "true"

machine_type = "e2-medium"
disk_size_gb = "40"
max_nodes    = "1"

oauth_scopes = [
  "https://www.googleapis.com/auth/cloud-platform",
  "https://www.googleapis.com/auth/logging.write",
  "https://www.googleapis.com/auth/monitoring",
]

workload_metadata_enabled = "true"

# custom node taints
taint = [
  {
    key    = "node.cilium.io/agent-not-ready"
    value  = "true"
    effect = "NO_SCHEDULE"
  }
]


# private GKE cluster settings
enable_private_endpoint        = "true"
master_ipv4_cidr_block         = "10.100.100.0/28"    # CIDR of GKE control-plane, this needs to be /28
enable_private_nodes           = "true"               # ATTENTION: when enable_private_nodes = true, Cloud NAT will be provisioned
master_authorized_network_cidr = "my.ext.ip.addr/32"  # this gets used only if enable_private_endpoint = false
iap_proxy_ip_cidr              = "192.168.100.0/29"
