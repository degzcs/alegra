require 'spec_helper'

describe Alegra::Invoices do
  context 'simple invoice' do
    before :each do
      @params = {
        username: 'ejemploapi@dayrep.com',
        apikey: '066b3ab09e72d4548e88'
      }
    end

    it 'should retieve an invoice' do
      VCR.use_cassette('simple_invoice') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.find(1)
        expect(invoice.class).to eq Hash
        expect(invoice).to include(simple_invoice_response)
      end
    end

    it 'should get all invoices' do
      VCR.use_cassette('list_of_invoices') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoices = client.invoices.list()
        expect(invoices.class).to eq Array
        expect(invoices).to eq(invoices_group_response)
      end
    end

    it 'should create a simple invoice' do
      VCR.use_cassette('create_simple_invoice') do
        _params = {
          date: '2016-10-12',
          due_date: '2016-10-12',
          client: 1,
          items: [
                    {
                        id: 1,
                        price: 40,
                        quantity: 5
                    },
                    {
                        id: 2,
                        description: 'Brown leather wallet',
                        price: 80,
                        discount: 10,
                        tax: [
                                {
                                    id: 3,
                                }
                             ],
                        quantity: 1
                    }
                  ],
          account_number: 1234,
          payment_method: 'cash',
          stamp: {
            generate_stamp: true
          },
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.create(_params)
        expect(invoice.class).to eq Hash
        expect(invoice).to include(create_invoice_response)
      end
    end

    it 'should create a completed invoice' do
    end
  end
end