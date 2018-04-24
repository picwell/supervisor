# frozen_string_literal: true
#
# Cookbook:: supervisor_service_test
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'supervisor_service_test' do
  before do
    allow(Mixlib::ShellOut).to receive(:new).with('supervisorctl status').and_return(status)
    allow(Mixlib::ShellOut).to receive(:new)
      .with('supervisorctl start start_service | grep -v ERROR')
      .and_return(double(run_command: double(exitstatus: 0)))
  end

  context 'enable_service' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(
        step_into: 'supervisor_service'
      )
      runner.converge("#{described_recipe}::enable_service")
    end
    let(:status) do
      double(
        run_command: double(
          stdout: '',
          exitstatus: 0
        )
      )
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'enables a supervisor_service' do
      expect(chef_run).to enable_supervisor_service('enable_service')
    end

    it 'creates a supervisor template' do
      expect(chef_run).to create_template('/etc/supervisor.d/enable_service.conf')
    end
  end

  context 'disable_service' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(
        step_into: 'supervisor_service'
      )
      runner.converge("#{described_recipe}::disable_service")
    end
    let(:status) do
      double(
        run_command: double(
          stdout: 'disable_service:RUNNING',
          exitstatus: 0
        )
      )
    end

    it 'disables a supervisor_service' do
      expect(chef_run).to disable_supervisor_service('disable_service')
    end

    it 'deletes the supervisor service config' do
      expect(chef_run).to delete_file('/etc/supervisor.d/disable_service.conf')
    end
  end

  context 'start_service' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(
        step_into: 'supervisor_service'
      )
      runner.converge("#{described_recipe}::start_service")
    end
    let(:status) do
      double(
        run_command: double(
          stdout: 'start_service:RUNNING',
          exitstatus: 0
        )
      )
    end

    it 'starts a supervisor_service' do
      expect(chef_run).to start_supervisor_service('start_service')
    end
  end
end
