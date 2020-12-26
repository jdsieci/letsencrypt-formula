# frozen_string_literal: true

describe file('/opt/letsencrypt') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_readable }
  its('size') { should be > 25 }
end

describe file('/etc/letsencrypt/cli.ini') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_readable }
  its('size') { should be > 1 }
  its('content') do
    should match 'server = https://acme-staging.api.letsencrypt.org/directory'
  end
  its('content') { should match 'authenticator = standalone' }
  its('content') { should match 'File managed by Salt' }
end
