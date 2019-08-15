# Packet CPR with Terraform

This repository contains terraform files that will use as basis on setting up Custom Partition and RAID with Terraform.

## Getting Started

You should be familiar with the API calls available for device provisioning. 
You should also be aware of our standard disk configurations for each server type.  With a few hardware-specific exceptions, generally speaking, this looks like:

* t1.small.x86:    1 × 80 GB, no RAID
* c1.small.x86:   2 × 120 GB SSD in RAID 1
* x1.small.x86:   240 GB of SSD (1 × 240 GB)
* m1.xlarge.86: 2.8 TB of SSD (6 × 480GB SSD)
* m2.xlarge.x86 (Intel Scalable): 2 × 120 GB in RAID 1 & 3.8 TB of NVMe Flash 
* c1.larger.arm: 1 × 340 GB SSD, no RAID
* c1.xlarge.x86:  2 × 120 GB SSD in RAID 1
* c2.medium.x86 (EPYC): 960 GB of SSD (2 x 480 GB)
* s1.large.x86:  2 x 480 GB SSD in RAID 1, with 120 GB SSD as cache in front of 12 X 2 TB HDD. 

### Prerequisites

* You have terraform setup on your machine
* You have a reserved hardware on Packet

### Installing

1. Clone the repo to your local

```
git clone https://github.com/dante-packet/packet-terraform-cpr.git
```

2. Change the project id on main.tf and auth_token on vars.tf

```
main.tf
project_id = "[your_packet_project_id]"

vars.tf
default     = "[your_packet_API_key]"
```
3. Execute terraform commands

```
$ terraform init

$ terraform plan

$ terraform apply

```

4. Verify your server in the Packet portal

5. The default setup is for t1.small, please change this to your preferred device you may refer below

```
https://support.packet.com/kb/articles/custom-partitioning-raid
```

## Author

* **Dante Pinggoy** 

