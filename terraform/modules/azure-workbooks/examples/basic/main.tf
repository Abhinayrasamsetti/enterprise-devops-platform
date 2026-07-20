module "workbook" {
  source="../../"
  name="platform-workbook"
  display_name="Platform Monitoring"
  resource_group_name="rg-monitoring"
  location="Central India"
  workbook_json="platform-workbook.json"
}
