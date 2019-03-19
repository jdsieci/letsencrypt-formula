
describe file('/opt/letsencrypt') do
 it { should_not exist }
end

describe file('/etc/letsencrypt/cli.ini') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_readable }
    its('size') { should be > 1 }

    its('content') { should match 'server = https://acme-staging.api.letsencrypt.org/directory' }
    its('content') { should match 'authenticator = webroot' }
end

describe file('/usr/bin/letsencrypt') do
  it { should be_symlink }
end

certbot = file('/usr/bin/letsencrypt').link_path
describe file(certbot) do
  it { should exist }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
