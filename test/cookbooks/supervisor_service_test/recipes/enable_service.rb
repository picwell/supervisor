# frozen_string_literal: true
#
# Cookbook:: enable_service
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'supervisor::default'

supervisor_service 'enable_service'
