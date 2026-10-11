resource "google_iam_workforce_pool_iam_binding" "iam_workforce_pool_iam_bindings" {
  for_each = var.iam_workforce_pool_iam_bindings

  members           = each.value.members
  role              = each.value.role
  workforce_pool_id = each.value.workforce_pool_id
  location          = each.value.location

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

