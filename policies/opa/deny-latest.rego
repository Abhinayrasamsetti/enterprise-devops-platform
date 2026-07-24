package kubernetes.security
deny[msg] {
  input.kind == "Deployment"
  endswith(input.spec.template.spec.containers[_].image, ":latest")
  msg := "latest tag is not allowed"
}
