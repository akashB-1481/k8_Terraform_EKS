resource "aws_launch_template" "eks_node" {
  name_prefix = "devops-eks-node"
  image_id = data.aws_ami.eks_default.id
  instance_type = var.var_terra.instance_type

  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"
    http_put_response_hop_limit = 2 

  }

  user_data = base64encode(<<EOF
#!/bin/bash
/etc/eks/bootstrap.sh devop-eks-cluster
EOF
)
  tag_specifications {
    resource_type = "instance"
    tags = {
      name = "devops-eks-node"
    }
  }
}