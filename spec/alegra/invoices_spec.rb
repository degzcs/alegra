# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Invoices do
  context 'Invoices' do
    before :each do
      @params = {
        username: 'ejemplo@ejemplo.com',
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
        invoices = client.invoices.list
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
                  id: 3
                }
              ],
              quantity: 1
            }
          ],
          account_number: 1234,
          payment_method: 'cash',
          stamp: {
            generate_stamp: true
          }
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.create(_params)
        expect(invoice.class).to eq Hash
        expect(invoice).to include(create_invoice_response)
      end
    end

    it 'should update an invoice' do
      VCR.use_cassette('update_invoice') do
        _params = { observations: 'This invoice has been updated!' }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.update(1, _params)
        expect(invoice.class).to eq Hash
        expect(invoice).to include(update_invoice_response)
      end
    end

    it 'should send an invoice by email' do
      VCR.use_cassette('send_email_invoice_response') do
        _params = {
          emails: ['test@alegra.com']
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        invoice = client.invoices.send_by_email(1, _params)
        expect(invoice.class).to eq Hash
        expect(invoice).to include(code: '200', message: 'La factura fue enviada exitosamente')
      end
    end

    it 'should create a completed invoice' do
    end
  end
end
