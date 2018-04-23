# frozen_string_literal: true
#
# Cookbook:: supervisor_service_test
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'supervisor_service' do
  context 'When all attributes are default, on Ubuntu 14.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(
        platform: 'ubuntu',
        version: '14.04',
        step_into: 'supervisor_service'
      )
      runner.converge('supervisor_service_test::default')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
