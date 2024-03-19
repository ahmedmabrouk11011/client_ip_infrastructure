terraform {
  source = "../../../modules/github-CICD"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
  usergroup_name = dependency.kubernetes-addons.outputs.admin_group_name
}

dependency "kubernetes-addons" {
  config_path = "../kubernetes-addons"

  mock_outputs = {
    admin_group_name            = "demo"
  }
}