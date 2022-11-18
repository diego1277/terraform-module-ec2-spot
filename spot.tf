resource "aws_spot_instance_request" "this" {
  ami           = var.ami_name
  spot_price    = var.spot_price
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  spot_type = var.spot_type
  security_groups = var.sg_ids
  wait_for_fulfillment = var.wait_for_fulfillment
  user_data = var.user_data != null ? var.user_data : null
  key_name = var.generate_key_pair ? aws_key_pair.this[0].key_name : var.key_name
  associate_public_ip_address= var.enable_public_ip
  iam_instance_profile = var.iam_rule != null ? var.iam_rule : null

  dynamic "root_block_device" {
    for_each = var.root_block_device
    iterator = root_block
    content {
      volume_type = root_block.value.volume_type
      volume_size = root_block.value.volume_size
      delete_on_termination = root_block.value.delete_on_termination
      encrypted = root_block.value.encrypted
      tags = {
        Name = "${var.name}_${root_block.key}_ebs"
      }
    }
  }

  tags = {
    Name = var.name
  }
}
