require 'spec_helper'

describe package('mongodb-org') do
	it { should be_installed }
end

describe service('mongod') do
	it { should be_enabled }
	it { should be_running }
end

describe port(27017) do
	it { should be_listening }
end

