resource "local_file" "recording_rules" {
  filename = "${path.module}/generated-rules.yaml"
  content  = file(var.rules_file)
}
