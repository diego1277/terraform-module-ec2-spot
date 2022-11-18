variable name {
  description = "instance name"
  type = string
}

variable instance_type {
  description = "instance type"
  type = string
  default = "t2.micro"
}
 
variable ami_name {
  description = "ami name"
  type = string 
  default = "ami-0bbe28eb2173f6167"  
}

variable key_name {
  description = "Key name"
  type = string
  default = null
}

variable spot_type {
  description = "Spot request type"
  type = string
  default = "one-time"
}

variable wait_for_fulfillment {
  description = "Wait for spot request fufillment"
  type = bool
  default = true
}

variable sg_ids {
  description = "security groups ids"
  type = list(string)
}

variable subnet_id {
  description = "subnets id"
  type = string
}
 
variable user_data {
  description = "user data configuration"
  type = string 
  default = null
}

variable iam_rule {
  description = "iam rule"
  type = string
  default = null
}

variable enable_public_ip {
  description = "enable public ip"
  type = bool
  default = true
}

variable root_block_device {
  description = "root block configs"
  type = map(object({volume_type=string,volume_size=number,delete_on_termination=bool,encrypted=bool}))
  default = {
    root = {
      volume_type = "gp2"
      volume_size = 8
      delete_on_termination = true
      encrypted = false
    }
  }
}

variable generate_key_pair {
  description = "auto generate key pair"
  type = bool
  default = false
}

variable spot_price {
  description = "Spot max price"
  type = string
  default = "On-demand"
}
