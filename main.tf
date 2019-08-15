# Configure the Packet Provider. 
provider "packet" {
   auth_token = "${var.auth_token}"
  # auth_token = "jCsSBx3VhbyEf5uua2LuSFEQtTUdB1xd"
}

# Declare your project ID
#
# You can find ID of your project form the URL in the Packet web app.
# For example, if you see your devices listed at
# https://app.packet.net/projects/352000fb2-ee46-4673-93a8-de2c2bdba33b
# .. then 352000fb2-ee46-4673-93a8-de2c2bdba33b is your project ID.
locals {
  project_id = "e3123b01-0047-48ef-989e-c34a7bb6b9c3"
}

# If you want to create a fresh project, you can create one with packet_project
# 
# resource "packet_project" "cool_project" {
#   name           = "My First Terraform Project"
# }

# Create a device and add it to tf_project_1
resource "packet_device" "web1" {
  hostname         = "${lookup (var.hostnames, count.index)}"
  plan             = "t1.small.x86"
  facilities       = ["sjc1"]
  operating_system = "ubuntu_18_04"
  billing_cycle    = "hourly"
  count            = "2"
  project_id       = "${local.project_id}"
  hardware_reservation_id = "next-available"
  storage = <<EOS
{
  "disks": [
    {
      "device": "/dev/sda",
      "wipeTable": true,
      "partitions": [
        {
          "label": "BIOS",
          "number": 1,
          "size": 4096
        },
        {
          "label": "SWAP",
          "number": 2,
          "size": "3993600"
        },
        {
          "label": "ROOT",
          "number": 3,
          "size": 0
        }
      ]
    }
  ],
  "filesystems": [
    {
      "mount": {
        "device": "/dev/sda3",
        "format": "ext4",
        "point": "/",
        "create": {
          "options": [
            "-L",
            "ROOT"
          ]
        }
      }
    },
    {
      "mount": {
        "device": "/dev/sda2",
        "format": "swap",
        "point": "none",
        "create": {
          "options": [
            "-L",
            "SWAP"
          ]
        }
      }
    }
  ]
}
EOS
  # if you have created project with packet_project resource, refer to its ID
  # project_id       = "${packet_project.cool_project.id}"
}