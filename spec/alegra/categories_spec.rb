# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Categories do
  context 'Categories' do
    before :each do
      @params = {
        username: 'ejemploapi@dayrep.com',
        apikey: '066b3ab09e72d4548e88'
      }
      @client = Alegra::Client.new(@params[:username], @params[:apikey])
    end

    it 'should list all categories' do
      VCR.use_cassette('categories') do
        categories = @client.categories.list(format: 'plain')
        expect(categories.class).to eq Array
        expect(categories.size).to eq 91
      end
    end

    it 'should get a specific category' do
      VCR.use_cassette('simple_category') do
        expected_response = { id: '5047',
                              id_parent: '5046',
                              name: 'Cuentas por pagar - proveedores',
                              description: 'Bajo esta categoría se encuentran los pasivos principales',
                              type: 'liability',
                              read_only: false,
                              category_rule: {id: '11', name: 'Cuentas por pagar - proveedores', key: 'DEBTS_TO_PAY_PROVIDERS'} }
        category = @client.categories.find('5047')
        expect(category.class).to eq Hash
        expect(category).to eq(expected_response)
      end
    end
  end
end
