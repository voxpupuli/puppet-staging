require 'spec_helper'
describe 'staging::extract', type: :define do
  # forcing a more sane caller_module_name to match real usage.
  let(:facts) do
    {
      os: { family: 'RedHat' },
      path: '/usr/local/bin:/usr/bin:/bin'
    }
  end

  describe 'when deploying tar.gz' do
    let(:title) { 'sample.tar.gz' }
    let(:params) { { target: '/opt' } }

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.tar.gz').with(command: 'tar xzf /opt/staging/sample.tar.gz',
                                                                path: '/usr/local/bin:/usr/bin:/bin',
                                                                cwd: '/opt',
                                                                creates: '/opt/sample')
    end
  end

  describe 'when deploying tar.gz with strip' do
    let(:title) { 'sample.tar.gz' }
    let(:params) do
      { target: '/opt',
        strip: 1 }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.tar.gz').with(command: 'tar xzf /opt/staging/sample.tar.gz --strip=1',
                                                                path: '/usr/local/bin:/usr/bin:/bin',
                                                                cwd: '/opt',
                                                                creates: '/opt/sample')
    end
  end

  describe 'when deploying tbz2' do
    let(:title) { 'sample.tbz2' }
    let(:params) { { target: '/opt' } }

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.tbz2').with(command: 'tar xjf /opt/staging/sample.tbz2',
                                                              path: '/usr/local/bin:/usr/bin:/bin',
                                                              cwd: '/opt',
                                                              creates: '/opt/sample')
    end
  end

  describe 'when deploying zip' do
    let(:title) { 'sample.zip' }
    let(:params) { { target: '/opt' } }

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.zip').with(command: 'unzip  /opt/staging/sample.zip',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying zip with unzip_opts' do
    let(:title) { 'sample.zip' }
    let(:params) do
      {
        target: '/opt',
        unzip_opts: '-o -f'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.zip').with(command: 'unzip -o -f /opt/staging/sample.zip',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying zip with untar_opts' do
    let(:title) { 'sample.tar' }
    let(:params) do
      {
        target: '/opt',
        untar_opts: '--exclude=conf/'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.tar').with(command: 'tar xf /opt/staging/sample.tar --exclude=conf/',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying zip with strip (noop)' do
    let(:title) { 'sample.zip' }
    let(:params) do
      {
        target: '/opt',
        strip: 1
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.zip').with(command: 'unzip  /opt/staging/sample.zip',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying zip with 7zip' do
    let(:title) { 'sample.zip' }
    let(:params) do
      {
        target: '/opt',
        use_7zip: true
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.zip').with(command: '7z x /opt/staging/sample.zip ',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying zip with 7zip and unzip_opts' do
    let(:title) { 'sample.zip' }
    let(:params) do
      {
        target: '/opt',
        use_7zip: true,
        unzip_opts: '-r'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.zip').with(command: '7z x /opt/staging/sample.zip -r',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying war' do
    let(:title) { 'sample.war' }
    let(:params) { { target: '/opt' } }

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.war').with(command: 'jar xf /opt/staging/sample.war',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying war with strip (noop) and unzip_opts (noop)' do
    let(:title) { 'sample.war' }
    let(:params) do
      {
        target: '/opt',
        strip: 1,
        unzip_opts: '-o -f'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.war').with(command: 'jar xf /opt/staging/sample.war',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying deb on a Debian family system' do
    let(:facts) do
      {
        os: { family: 'Debian' },
        path: '/usr/local/bin:/usr/bin:/bin'
      }
    end
    let(:title) { 'sample.deb' }
    let(:params) { { target: '/opt' } }

    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/opt/staging')
      is_expected.to contain_exec('extract sample.deb').with(command: 'dpkg --extract /opt/staging/sample.deb .',
                                                             path: '/usr/local/bin:/usr/bin:/bin',
                                                             cwd: '/opt',
                                                             creates: '/opt/sample')
    end
  end

  describe 'when deploying deb on a non-Debian family system' do
    let(:title) { 'sample.deb' }
    let(:params) do
      { target: '/opt' }
    end

    it 'fails' do
      is_expected.to compile.and_raise_error(%r{The .deb filetype is only supported on Debian family systems.})
    end
  end

  describe 'when deploying unknown' do
    let(:title) { 'sample.zzz' }
    let(:params) { { target: '/opt' } }

    it { expect { is_expected.to contain_exec('exec sample.zzz') }.to raise_error(Puppet::Error) }
  end
end
