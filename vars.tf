// PACKET CREDENTIALS
// Your Packet API Key, grab one from the portal at https://app.packet.net/portal#/api-keys
variable "auth_token" {
	description = "Packet API Token"
	default     = "[your_packet_API_key]"
}

variable "hostnames" {
  default = {
	  "0" = "test1.tftestcpr"
	 # "1" = "test2.tftestcpr"
  }
}
