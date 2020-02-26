# frozen_string_literal: true

require 'spec_helper'

describe Alegra::BankAccounts do
  context 'BankAccounts' do
    before :each do
      @params = {
        username: 'ejemploapi@dayrep.com',
        apikey: '066b3ab09e72d4548e88'
      }
      @client = Alegra::Client.new(@params[:username], @params[:apikey])
    end

    it 'should list all bank accounts' do
      VCR.use_cassette('bank_accounts') do
        expected_response = [{ id: '2',
                               name: 'Banco 1',
                               number: nil,
                               description: '',
                               type: 'bank',
                               status: 'active' },
                             { id: '3',
                               name: 'Tarjeta de crédito 1',
                               number: nil,
                               description: '',
                               type: 'credit-card',
                               status: 'active' },
                             { id: '1',
                               name: 'Caja general',
                               number: nil,
                               description: 'Caja general de la empresa',
                               type: 'cash',
                               status: 'active' }]

        bank_accounts = @client.bank_accounts.list
        expect(bank_accounts.class).to eq Array
        expect(bank_accounts).to eq expected_response
      end
    end

    it 'should get a specific bank_account' do
      VCR.use_cassette('simple_bank_account') do
        expected_response = { id: '2',
                              name: 'Banco 1',
                              number: nil,
                              description: '',
                              type: 'bank',
                              status: 'active' }
        bank_account = @client.bank_accounts.find(2)
        expect(bank_account.class).to eq Hash
        expect(bank_account).to eq(expected_response)
      end
    end

    it 'creates a new bank_account' do
      VCR.use_cassette('create_simple_bank_account') do
        expected_response = { id: '9',
                              name: 'test',
                              number: nil,
                              description: '',
                              type: 'bank',
                              status: 'active' }

        params = { name: 'test',
                   type: 'bank',
                   initial_balance: '100000',
                   initial_balance_date: '2020-02-25' }

        bank_account = @client.bank_accounts.create(params)
        expect(bank_account.class).to eq Hash
        expect(bank_account).to eq(expected_response)
      end
    end

    it 'creates a new transfer from bank_account :id to an other' do
      VCR.use_cassette('create_simple_bank_transfer') do
        expected_response = { origin_account: { id: '7',
                                                name: 'test',
                                                number: nil,
                                                description: '',
                                                type: 'bank',
                                                status: 'active' },
                              destination_account: { id: '4',
                                                     name: 'Bancolombia',
                                                     number: '0093230987',
                                                     description: 'Cuenta de Bancolombia',
                                                     type: 'bank',
                                                     status: 'active' },
                              amount: 100_000 }

        params = { id_destination: 4,
                   amount: 100000,
                   date: '2020-02-25' }

        bank_account_transfer = @client.bank_accounts.transfer(7, params)
        expect(bank_account_transfer.class).to eq Hash
        expect(bank_account_transfer).to eq(expected_response)
      end
    end
  end
end
