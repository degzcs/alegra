require 'spec_helper'

describe Alegra::Invoices do
  context 'simple invoice' do
    before :each do
      @params = {
        username: 'ejemploapi@alegra.com',
        apikey: 'tokenejemploapi12345'
      }
    end

    it 'should retieve an invoice' do
      VCR.use_cassette('simple_invoice') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.find(1)
        expect(invoice.class).to eq Hash
      end
    end
  end
end