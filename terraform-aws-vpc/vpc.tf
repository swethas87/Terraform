resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    { Name = local.resource_name }

  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.public_subnet_cidr_tags,
    {
    Name = local.az_names[0] }
  )
}

###public subnet
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.public_subnet_cidr_tags,
    {
      Name = "${local.resource_name}-${local.az_names[count.index]}"
    }

  )
}
