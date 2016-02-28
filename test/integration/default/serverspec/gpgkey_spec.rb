require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('haveged'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe file('/home/vagrant/pubkey') do
  it { should be_file }
end

describe file('/home/vagrant/privkey') do
  it { should be_file }
end

describe file('/home/vagrant/vagrant.asc') do
  it { should be_file }
  its(:content) { should match /-----BEGIN PGP PUBLIC KEY BLOCK-----/ }
end

