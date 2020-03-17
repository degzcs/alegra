# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Company do
  context 'Company' do
    before :each do
      @params = {
        username: 'ejemplo@ejemplo.com',
        apikey: '066b3ab09e72d4548e88'
      }
      @client = Alegra::Client.new(@params[:username], @params[:apikey])
    end

    it 'should get the company information' do
      VCR.use_cassette('company') do
        expected_response = {
          name: 'ejemploapi@legra',
          identification: '1061687132-1',
          phone: '5167770',
          website: 'test.com',
          email: 'test@test.com',
          regime: 'Responsable del IVA',
          application_version: 'colombia',
          registry_date: '2016-10-12 09:48:45',
          timezone: 'America/Bogota',
          profile: nil,
          address: { city: 'Medellin', department: nil, address: 'calle falsa 123', zip_code: nil },
          currency: { code: 'COP', symbol: '$' },
          multicurrency: false,
          decimal_precision: '0',
          invoice_preferences: { default_anotation: nil,
                                 default_terms_and_conditions: 'Esta factura se asimila en todos sus efectos a una letra de cambio de conformidad con el Art. 774 del código de comercio. Autorizo que en caso de incumplimiento de esta obligación sea reportado a las centrales de riesgo, se cobraran intereses por mora.' },
          logo: 'https://d3r8o2i8390sjv.cloudfront.net/application/production/company-logos/48302296106c20092d3279f24',
          kind_of_person: '',
          identification_object: { type: nil, number: '1061687132-1' },
          settings: { can_stamp_invoices: false, electronic_invoicing: false }
        }

        company = @client.company.find
        expect(company.class).to eq Hash
        expect(company).to eq expected_response
      end
    end

    it 'should update the company' do
      VCR.use_cassette('update_completed_company') do
        expected_response = {
          name: 'ejemploapi@legra',
          identification: '1061687132-1',
          phone: '5167770',
          website: 'nominapp.com',
          email: 'test@test.com',
          regime: 'Responsable del IVA',
          application_version: 'colombia',
          registry_date: '2016-10-12 09:48:45',
          timezone: 'America/Bogota',
          profile: nil,
          address: { city: 'Medellin', department: nil, address: 'calle falsa 123', zip_code: nil },
          currency: { code: 'COP', symbol: '$' },
          multicurrency: false,
          decimal_precision: '0',
          invoice_preferences: { default_anotation: nil,
                                 default_terms_and_conditions: 'Esta factura se asimila en todos sus efectos a una letra de cambio de conformidad con el Art. 774 del código de comercio. Autorizo que en caso de incumplimiento de esta obligación sea reportado a las centrales de riesgo, se cobraran intereses por mora.' },
          logo: 'https://d3r8o2i8390sjv.cloudfront.net/application/production/company-logos/48302296106c20092d3279f24',
          kind_of_person: '',
          identification_object: { type: nil, number: '1061687132-1' },
          settings: { can_stamp_invoices: false, electronic_invoicing: false }
        }
        params = { website: 'nominapp.com' }
        company = @client.company.update(params)
        expect(company.class).to eq Hash
        expect(company).to eq(expected_response)
      end
    end
  end
end
