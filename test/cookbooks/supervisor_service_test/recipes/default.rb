#
# Cookbook:: supervisor_service_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'supervisor::default'

supervisor_service 'test_service'
