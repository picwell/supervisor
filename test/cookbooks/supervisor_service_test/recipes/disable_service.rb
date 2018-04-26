# frozen_string_literal: true
#
# Cookbook:: disable_service
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'supervisor::default'

supervisor_service 'disable_service' do
  action :disable
end
