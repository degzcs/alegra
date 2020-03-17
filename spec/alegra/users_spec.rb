# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Users do
  context 'User' do
    before :each do
      @params = {
        username: 'ejemplo@ejemplo.com',
        apikey: '066b3ab09e72d4548e88'
      }
      @client = Alegra::Client.new(@params[:username], @params[:apikey])
    end

    it 'should get the lists of users' do
      VCR.use_cassette('users') do
        expected_response = [
          {
            email: 'ejemplo@ejemplo.com',
            id: '1',
            last_name: nil,
            name: nil,
            permissions: {
              bank_accounts: { add: 'allow', transfer: 'allow', view: 'allow' },
              bills: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
              categories: { view: 'allow' },
              company: { edit: 'allow', retrieve_info: 'allow' },
              contacts:
                { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
              currencies: { index: 'allow' },
              estimates:
                { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
              invoices: {
                add: 'allow',
                edit: 'allow',
                edit_items_prices: 'allow',
                email: 'allow',
                view: 'allow',
                void: 'allow'
              },
              items: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
              payments: {
                add: 'allow',
                edit: 'allow',
                edit_in: 'allow',
                edit_out: 'allow',
                retrieve_in: 'allow',
                view: 'allow',
                viewin: 'allow',
                viewout: 'allow'
              },
              pos_cashier: {
                close: 'allow', index: 'allow', open: 'allow', view: 'allow'
              },
              pos_station: {
                add: 'allow',
                delete: 'allow',
                edit: 'allow',
                index: 'allow',
                view: 'allow'
              },
              price_lists: { view: 'allow' },
              remissions: {
                add: 'allow',
                delete: 'allow',
                edit: 'allow',
                view: 'allow'
              },
              retentions: { view: 'allow' },
              sellers: { add: 'allow', edit: 'allow' },
              taxes: { view: 'allow' },
              terms: { view: 'allow' }
            },
            role: 'admin',
            status: 'active'
          }
        ]
        users = @client.users.list
        expect(users.class).to eq Array
        expect(users).to eq expected_response
      end
    end

    it 'should return user with specific :id' do
      VCR.use_cassette('simple_user') do
        expected_response = { email: 'ejemplo@ejemplo.com',
                              id: '1',
                              last_name: nil,
                              name: nil,
                              permissions: {
                                bank_accounts: { add: 'allow', transfer: 'allow', view: 'allow' },
                                bills: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                categories: { view: 'allow' },
                                company: { edit: 'allow', retrieve_info: 'allow' },
                                contacts:
                                  { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                currencies: { index: 'allow' },
                                estimates:
                                  { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                invoices: {
                                  add: 'allow',
                                  edit: 'allow',
                                  edit_items_prices: 'allow',
                                  email: 'allow',
                                  view: 'allow',
                                  void: 'allow'
                                },
                                items: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                payments: {
                                  add: 'allow',
                                  edit: 'allow',
                                  edit_in: 'allow',
                                  edit_out: 'allow',
                                  retrieve_in: 'allow',
                                  view: 'allow',
                                  viewin: 'allow',
                                  viewout: 'allow'
                                },
                                pos_cashier: {
                                  close: 'allow', index: 'allow', open: 'allow', view: 'allow'
                                },
                                pos_station: {
                                  add: 'allow',
                                  delete: 'allow',
                                  edit: 'allow',
                                  index: 'allow',
                                  view: 'allow'
                                },
                                price_lists: { view: 'allow' },
                                remissions: {
                                  add: 'allow',
                                  delete: 'allow',
                                  edit: 'allow',
                                  view: 'allow'
                                },
                                retentions: { view: 'allow' },
                                sellers: { add: 'allow', edit: 'allow' },
                                taxes: { view: 'allow' },
                                terms: { view: 'allow' }
                              },
                              role: 'admin',
                              status: 'active' }
        users = @client.users.find(1)
        expect(users.class).to eq Hash
        expect(users).to eq expected_response
      end
    end

    it 'should return current user' do
      VCR.use_cassette('self_user') do
        expected_response = { email: 'ejemplo@ejemplo.com',
                              id: '1',
                              last_name: nil,
                              name: nil,
                              permissions: {
                                bank_accounts: { add: 'allow', transfer: 'allow', view: 'allow' },
                                bills: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                categories: { view: 'allow' },
                                company: { edit: 'allow', retrieve_info: 'allow' },
                                contacts:
                                  { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                currencies: { index: 'allow' },
                                estimates:
                                  { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                invoices: {
                                  add: 'allow',
                                  edit: 'allow',
                                  edit_items_prices: 'allow',
                                  email: 'allow',
                                  view: 'allow',
                                  void: 'allow'
                                },
                                items: { add: 'allow', delete: 'allow', edit: 'allow', view: 'allow' },
                                payments: {
                                  add: 'allow',
                                  edit: 'allow',
                                  edit_in: 'allow',
                                  edit_out: 'allow',
                                  retrieve_in: 'allow',
                                  view: 'allow',
                                  viewin: 'allow',
                                  viewout: 'allow'
                                },
                                pos_cashier: {
                                  close: 'allow', index: 'allow', open: 'allow', view: 'allow'
                                },
                                pos_station: {
                                  add: 'allow',
                                  delete: 'allow',
                                  edit: 'allow',
                                  index: 'allow',
                                  view: 'allow'
                                },
                                price_lists: { view: 'allow' },
                                remissions: {
                                  add: 'allow',
                                  delete: 'allow',
                                  edit: 'allow',
                                  view: 'allow'
                                },
                                retentions: { view: 'allow' },
                                sellers: { add: 'allow', edit: 'allow' },
                                taxes: { view: 'allow' },
                                terms: { view: 'allow' }
                              },
                              role: 'admin',
                              status: 'active' }
        user = @client.users.find_current
        expect(user.class).to eq Hash
        expect(user).to eq expected_response
        expect(user[:email]).to eq @params[:username]
      end
    end
  end
end
