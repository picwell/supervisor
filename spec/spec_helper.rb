# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'

  config.before(:each) do
    # protect user from accidentally running command locally with ShellOut
    allow(Mixlib::ShellOut).to receive(:new).with(any_args) do |obj|
      msg = "Call to Mixlib::ShellOut detected. Executing commands on your machine is not safe!\n" \
        "You can stub this command in a `before` block with something like:\n" \
        "  dbl = double(run_command: nil, stdout: 'expected output')\n" \
        "  allow(Mixlib::ShellOut).to receive(:new).with('#{obj}').and_return(dbl)"
      raise msg
    end
  end
end
