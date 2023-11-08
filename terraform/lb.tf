# resource "aws_lb" "this" {
#   name                       = "swarm-lb"
#   internal                   = false
#   load_balancer_type         = "application"
#   security_groups            = [aws_security_group.swarm.id]
#   subnets                    = [aws_subnet.public_a.id, aws_subnet.public_b.id]
#   enable_deletion_protection = false
# }

# resource "aws_lb_listener" "this" {

#   load_balancer_arn = aws_lb.this.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.this.arn
#   }
# }

# resource "aws_lb_target_group_attachment" "swarm_node1" {
#   target_group_arn = aws_lb_target_group.this.arn
#   target_id        = aws_instance.node1.id
#   port             = 80
# }
# resource "aws_lb_target_group_attachment" "swarm_node2" {
#   target_group_arn = aws_lb_target_group.this.arn
#   target_id        = aws_instance.node2.id
#   port             = 80
# }
# resource "aws_lb_target_group" "this" {
#   name        = "swarm-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      = aws_vpc.this.id

#   health_check {
#     interval            = 10
#     path                = "/"
#     port                = "80"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }

#   depends_on = [aws_instance.node1, aws_instance.node2]
# }