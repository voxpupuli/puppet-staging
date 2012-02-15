require 'spec_helper'
describe 'staging::file', :type => :define do

  describe 'testing' do
     let(:title) { 'sample.tar.gz' }
     let(:params) { { :value => 'foo' } }
  end
end
