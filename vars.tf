// PACKET CREDENTIALS
// Your Packet API Key, grab one from the portal at https://app.packet.net/portal#/api-keys
variable "auth_token" {
	description = "Packet API Token"
	default     = "jCsSBx3VhbyEf5uua2LuSFEQtTUdB1xd"
}

variable "hostnames" {
  default = {
	  "0" = "test1.tftestcpr1"
	  "1" = "test2.tftestcpr1"
  }
}
