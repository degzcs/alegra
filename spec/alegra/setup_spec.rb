require 'spec_helper'

describe Alegra::Setup do
  subject(:setup) { Alegra::Setup.new(@setup_params[:username], @setup_params[:apikey]) }

  context 'connect with alegra API' do
    before :each do
      @setup_params = {
        username: 'ejemploapi@alegra.com',
        apikey: 'tokenejemploapi12345'
      }
    end

    it 'should validate the setup configuration' do
      expect(setup.host).to eq 'https://app.alegra.com/'
      expect(setup.path).to eq 'api/v1/'
      expect(setup.username).to eq @setup_params[:username]
      expect(setup.apikey).to eq @setup_params[:apikey]
      expect(setup.token).to eq Base64.encode64("#{ @setup_params[:username] }:#{ @setup_params[:apikey] }")
    end
  end
end