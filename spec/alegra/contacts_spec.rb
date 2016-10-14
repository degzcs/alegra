require 'spec_helper'

describe Alegra::Contacts do
  context 'simple invoice' do
    before :each do
      @params = {
        username: 'ejemploapi@dayrep.com',
        apikey: '066b3ab09e72d4548e88'
      }
    end

    it 'should get all contacts' do
      VCR.use_cassette('list_of_contacts') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.list()
        expect(contact.class).to eq Array
        expect(contact).to eq contacts_group_response
      end
    end

    it 'should call a specific contact' do
      VCR.use_cassette('simple_contact') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.find(1)
        expect(contact.class).to eq Hash
        expect(contact).to eq simple_contact_response
      end
    end

    it 'should to create a basic contact' do
      VCR.use_cassette('create_contact') do
        _params = {
          name: 'Alan Britho'
        }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.create(_params)
        expect(contact.class).to eq Hash
        expect(contact).to eq(create_contact_response)
      end
    end
  end
end