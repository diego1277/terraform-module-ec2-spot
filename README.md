# Terraform EC2 Spot module

## Requirements
Binary version ```v1.3.2```

## Providers

| Name | Version |
|------|---------|
| aws | 4.33.0 |
| local | 2.2.3 |
| tls | 4.0.4 |

## How to
Set default configuration
```
module "spot" {
   source = "https://github.com/diego1277/terraform-module-ec2-spot.git"
   name = "my-ec2"
   key_name = "my-key-name"
   subnet_id = "my-subnet-id"
   sg_ids = ["my-sg-id"]
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_name | ami name | `string` | `"ami-0bbe28eb2173f6167"` | no |
| enable\_public\_ip | enable public ip | `bool` | `true` | no |
| generate\_key\_pair | auto generate key pair | `bool` | `false` | no |
| iam\_rule | iam rule | `string` | `null` | no |
| instance\_type | instance type | `string` | `"t2.micro"` | no |
| key\_name | Key name | `string` | `null` | no |
| name | instance name | `string` | n/a | yes |
| root\_block\_device | root block configs | `map(object({volume_type=string,volume_size=number,delete_on_termination=bool,encrypted=bool}))` | <pre>{<br>  "root": {<br>    "delete_on_termination": true,<br>    "encrypted": false,<br>    "volume_size": 8,<br>    "volume_type": "gp2"<br>  }<br>}</pre> | no |
| sg\_ids | security groups ids | `list(string)` | n/a | yes |
| spot\_price | Spot max price | `string` | `"On-demand"` | no |
| spot\_type | Spot request type | `string` | `"one-time"` | no |
| subnet\_id | subnets id | `string` | n/a | yes |
| user\_data | user data configuration | `string` | `null` | no |
| wait\_for\_fulfillment | Wait for spot request fufillment | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Spot id |
| private\_dns | Spot private dns |
| private\_ip | Spot private ip |
| public\_dns | Spot public dns |
| public\_ip | Spot public ip |

## Author:
- `Diego Oliveira`
