resource "aws_eks_cluster" "dev_eks" {
    name = "devop-eks-cluster"
    version = "1.35"
    role_arn = aws_iam_role.eks_cluster_role.arn 
    vpc_config {
      subnet_ids = aws_subnet.dev_net.id 
    }
  tags = {
    name = "devops-eks"
  }
} 

resource "aws_eks_node_group" "dev_eks_node" {
      cluster_name    = aws_eks_cluster.dev_eks.name
      node_group_name = "devops-eks-node"
      node_role_arn   = aws_iam_role.eks_node_role.arn
      subnet_ids      = [aws_subnet.dev_net.id]

      scaling_config {
        min_size = 1
        max_size = 2
        desired_size = 2
      }

    instance_types = [var.var_terra.instance_type] 
    tags = {
        name = "devops-eks-node-group"
    }  
  
}