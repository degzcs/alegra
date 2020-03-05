# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Contacts do
  context 'Contacts' do
    before :each do
      @params = {
        username: 'ejemplo@ejemplo.com',
        apikey: '066b3ab09e72d4548e88'
      }
    end

    it 'should get all contacts' do
      VCR.use_cassette('list_of_contacts') do
        expected_response = [{ id: '1',
                               name: 'cliente',
                               identification: '123456789',
                               email: 'cliente@test.com',
                               phone_primary: '',
                               phone_secondary: '',
                               fax: '',
                               mobile: '3004232123',
                               observations: 'Este es un usuario de prueba',
                               address: { address: 'calle 1 # 3-2', city: 'Medellin' },
                               type: %w[client provider],
                               seller: nil,
                               term: { id: '1', name: 'De contado', days: '0' },
                               price_list: { id: '1', name: 'General' },
                               internal_contacts: [] }]

        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contacts = client.contacts.list
        expect(contacts.class).to eq Array
        expect(contacts).to eq expected_response
      end
    end

    it 'should call a specific contact' do
      VCR.use_cassette('simple_contact') do
        expected_response = { id: '1',
                              name: 'cliente',
                              identification: '123456789',
                              email: 'cliente@test.com',
                              phone_primary: '',
                              phone_secondary: '',
                              fax: '',
                              mobile: '3004232123',
                              observations: 'Este es un usuario de prueba',
                              address: { address: 'calle 1 # 3-2', city: 'Medellin' },
                              type: %w[client provider],
                              seller: nil,
                              term: { id: '1', name: 'De contado', days: '0' },
                              price_list: { id: '1', name: 'General' },
                              internal_contacts: [] }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.find(1)
        expect(contact.class).to eq Hash
        expect(contact).to eq expected_response
      end
    end

    it 'should create a basic contact' do
      VCR.use_cassette('create_contact') do
        expected_response = { id: '2',
                              name: 'Alan Britho',
                              identification: nil,
                              email: nil,
                              phone_primary: nil,
                              phone_secondary: nil,
                              fax: nil,
                              mobile: nil,
                              observations: nil,
                              address: { address: nil, city: nil },
                              type: [],
                              seller: nil,
                              term: nil,
                              price_list: nil,
                              internal_contacts: [] }
        _params = {
          name: 'Alan Britho'
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.create(_params)
        expect(contact.class).to eq Hash
        expect(contact).to eq(expected_response)
      end
    end

    it 'should create a completed contact' do
      VCR.use_cassette('create_completed_contact') do
        expected_response = { id: '4',
                              name: 'Armando Casas',
                              identification: '963.654.988',
                              email: 'armando.casas@alegra.com',
                              phone_primary: '111 11 11',
                              phone_secondary: nil,
                              fax: nil,
                              mobile: nil,
                              observations: nil,
                              address: { address: 'Avenida Madison', city: 'New York, USA' },
                              type: ['client'],
                              seller: { id: '1', name: 'Elmo Caritas', identification: '123123123', observations: 'Elmo Caritas' },
                              term: { id: '2', name: '8 días', days: '8' },
                              price_list: nil,
                              internal_contacts: [{ id: '2', name: 'Lina', last_name: 'Montoya', email: 'prueba4@alegra.com', phone: '123 45 67 ext 25', mobile: '(333) 333 33 33', send_notifications: false }] }
        _params = {
          name: 'Armando Casas',
          identification: '963.654.988',
          email: 'armando.casas@alegra.com',
          phone_primary: '111 11 11',
          seller: {
            id: '1'
          },
          term:
                        {
                          id: 2
                        },
          type: ['client'],
          address: {
            address: 'Avenida Madison',
            city: 'New York, USA'
          },
          internal_contacts: [
            {
              name: 'Lina',
              last_name: 'Montoya',
              email: 'prueba4@alegra.com',
              phone: '123 45 67 ext 25',
              mobile: '(333) 333 33 33',
              send_notifications: 'no'
            }
          ]
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.create(_params)
        expect(contact.class).to eq Hash
        expect(contact).to eq(expected_response)
      end
    end

    it 'should update a contact' do
      VCR.use_cassette('update_completed_contact') do
        expected_response = { id: '1',
                              name: 'A. Sara Osa',
                              identification: '123456789',
                              email: 'cliente@test.com',
                              phone_primary: '',
                              phone_secondary: '',
                              fax: '',
                              mobile: '3004232123',
                              observations: 'Este es un usuario de prueba',
                              address: { address: 'calle 1 # 3-2', city: 'Medellin' },
                              type: [],
                              seller: nil,
                              term: { id: '1', name: 'De contado', days: '0' },
                              price_list: { id: '1', name: 'General' },
                              internal_contacts: [] }
        _params = { name: 'A. Sara Osa' }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.update(1, _params)
        expect(contact.class).to eq Hash
        expect(contact).to eq(expected_response)
      end
    end

    it 'should delete a contact' do
      VCR.use_cassette('delete_contact') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.delete(9)
        expect(contact.class).to eq Hash
        expect(contact).to eq(code: 200, message: 'El contacto fue eliminado correctamente.')
      end
    end
  end
end
