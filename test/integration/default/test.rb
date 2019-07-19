describe file('/usr/local/bin/vault') do
  it { should exist }
end

describe command('vault') do
  it { should exist }
end
