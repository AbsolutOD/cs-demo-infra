
# resource "random_password" "password" {
#   length = 16
#   special = true
#   override_special = "_%@"
# }

resource "aws_db_subnet_group" "demo" {
  name       = "demo_db"
  subnet_ids = ["subnet-036eec2c9e2912668", "subnet-0ca112da8745ab2ac"]

  tags = {
    Name = "Demo DB subnet group"
  }
}

resource "aws_db_instance" "demo" {
  allocated_storage    = 10
  db_name              = "url_shortener"
  engine               = "postgres"
  #engine_version       = "14.4-R1"
  instance_class       = "db.t3.micro"
  username             = "demo"
  password             = var.db_password
  #parameter_group_name = "default.postgres14"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.demo.name
}
