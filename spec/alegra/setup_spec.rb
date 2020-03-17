require 'spec_helper'

describe Alegra::Setup do
  subject(:setup) { Alegra::Setup.new(@setup_params[:username], @setup_params[:apikey]) }

  context 'connect with alegra API' do
    before :each do
      @setup_params = {
        username: 'ejemplo@ejemplo.com',
        apikey: '066b3ab09e72d4548e88'
      }
    end

    it 'should validate the setup configuration' do
      expect(setup.host).to eq 'https://app.alegra.com/'
      expect(setup.path).to eq 'api/v1/'
      expect(setup.username).to eq @setup_params[:username]
      expect(setup.apikey).to eq @setup_params[:apikey]
      expect(setup.token).to eq Base64.strict_encode64("#{ @setup_params[:username] }:#{ @setup_params[:apikey] }")
    end
  end
end
