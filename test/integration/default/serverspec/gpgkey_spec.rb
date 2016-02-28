require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('haveged'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe file('/home/vagrant/dupont.pub') do
  it { should be_file }
end

describe file('/home/vagrant/dupont.priv') do
  it { should be_file }
end

describe file('/home/vagrant/dupont.asc') do
  it { should be_file }
  its(:content) { should match /-----BEGIN PGP PUBLIC KEY BLOCK-----/ }
end

