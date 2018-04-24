# frozen_string_literal: true
#
# Cookbook:: start_service
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'supervisor::default'

supervisor_service 'start_service' do
  action [:enable, :start]
end
