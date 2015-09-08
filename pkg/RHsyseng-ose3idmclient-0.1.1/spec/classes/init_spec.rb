require 'spec_helper'
describe 'ose3idmclient' do

  context 'with defaults for all parameters' do
    it { should contain_class('ose3idmclient') }
  end
end
