require 'spec_helper'
describe 'staging::deploy', :type => :define do

  let(:facts) {{
    :caller_module_name => '',
    :osfamily           => 'RedHat',
    :staging_http_get   => 'curl',
    :path               => '/usr/local/bin:/usr/bin:/bin',
  }}

  describe 'when deploying tar.gz' do
    let(:title) { 'sample.tar.gz' }
    let(:params) {{
      :source => 'puppet:///modules/staging/sample.tar.gz',
      :target => '/usr/local'
    }}

    it { should contain_file('/opt/staging') }
    it { should contain_file('/opt/staging//sample.tar.gz') }
    it {
      should contain_exec('extract sample.tar.gz').with({
        :command => 'tar xzf /opt/staging//sample.tar.gz',
        :path    => '/usr/local/bin:/usr/bin:/bin',
        :cwd     => '/usr/local',
        :creates => '/usr/local/sample'
      })
    }
  end

  describe 'when deploying tar.gz with strip' do
    let(:title) { 'sample.tar.gz' }
    let(:params) {{
      :source => 'puppet:///modules/staging/sample.tar.gz',
      :target => '/usr/local',
      :strip  => 1
    }}

    it { should contain_file('/opt/staging') }
    it { should contain_file('/opt/staging//sample.tar.gz') }
    it {
      should contain_exec('extract sample.tar.gz').with({
        :command => 'tar xzf /opt/staging//sample.tar.gz --strip=1',
        :path    => '/usr/local/bin:/usr/bin:/bin',
        :cwd     => '/usr/local',
        :creates => '/usr/local/sample'
      })
    }
  end

  describe 'when deploying zip file with unzip_opts' do
    let(:title) { 'sample.zip' }
    let(:params) do
      { :source => 'puppet:///modules/staging/sample.tar.gz',
        :target => '/usr/local',
        :unzip_opts  => '-o -f'
      }
    end
    it { should contain_file('/opt/staging') }
    it { should contain_file('/opt/staging//sample.zip') }
    it do
      should contain_exec('extract sample.zip').with({
        :command => 'unzip -o -f /opt/staging//sample.zip',
        :path    => '/usr/local/bin:/usr/bin:/bin',
        :cwd     => '/usr/local',
        :creates => '/usr/local/sample'
      })
    end
  end
end
