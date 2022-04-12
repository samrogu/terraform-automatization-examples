provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_ingress" "jenkins-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "jenkins-ingress"
    labels = {
      "app" = "jenkins-alb"
    }
    annotations = {
      "alb.ingress.kubernetes.io/group.name"         = "jenkins-ingress"
      "alb.ingress.kubernetes.io/listen-ports"       = "[{\"HTTP\": 80}, {\"HTTP\":8080}]"
      "alb.ingress.kubernetes.io/load-balancer-name" = "jenkinsci"
      "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
      # Health Check Settings
      "alb.ingress.kubernetes.io/healthcheck-protocol"        = "HTTP"
      "alb.ingress.kubernetes.io/healthcheck-port"             = "traffic-port"
      "alb.ingress.kubernetes.io/healthcheck-path"             = "/login"
      "alb.ingress.kubernetes.io/healthcheck-interval-seconds" = "15"
      "alb.ingress.kubernetes.io/healthcheck-timeout-seconds"  = "5"
      "alb.ingress.kubernetes.io/success-codes"                = "200"
      "alb.ingress.kubernetes.io/healthy-threshold-count"      = "2"
      "alb.ingress.kubernetes.io/unhealthy-threshold-count"    = "2"
      "alb.ingress.kubernetes.io/target-type"                  = "ip"
    }
  }
  spec {
    ingress_class_name = "aws-ingress-class-test"
    rule {
      http {
        path {
          path = "/*"
          backend {
            service_name = helm_release.jenkins.name
            service_port = 8080
          }
        }
      }
    }
  }
}
