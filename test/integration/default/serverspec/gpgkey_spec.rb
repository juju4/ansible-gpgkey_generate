require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('haveged'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
## lxc: haveged killed with 'haveged: Fail:set_watermark()!', can't write on /proc/sys/kernel/random/write_wakeup_threshold
##	entropy still raised/good
#  it { should be_running }
end

describe file('/home/myuser/dupont.pub') do
  it { should be_file }
end

describe file('/home/myuser/dupont.priv'), :if => os[:family] == 'redhat' do
  it { should be_file }
end

describe file('/home/myuser/dupont.priv'), :if => os[:family] == 'ubuntu' && os[:release] != '18.04' do
  it { should be_file }
end

describe file('/home/myuser/dupont.asc') do
  it { should be_file }
  its(:content) { should match /-----BEGIN PGP PUBLIC KEY BLOCK-----/ }
end

