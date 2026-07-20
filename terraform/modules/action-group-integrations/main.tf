resource "azurerm_monitor_action_group" "platform" {
  name                = var.name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name

  email_receiver {
    name          = "platform-team"
    email_address = var.notification_email
  }
}
