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

    it 'should create a basic contact' do
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

    it 'should create a completed contact' do
      VCR.use_cassette('create_completed_contact') do
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
        expect(contact).to eq(create_completed_contact_response)
      end
    end

    it 'should update a contact' do
      VCR.use_cassette('update_completed_contact') do
        _params = { name: 'A. Sara Osa'}
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.update(1, _params)
        expect(contact.class).to eq Hash
        expect(contact).to eq(update_contact_response)
      end
    end

    it 'should delete a contact' do
      VCR.use_cassette('delete_contact') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        contact = client.contacts.delete(9)
        expect(contact.class).to eq Hash
        expect(contact).to eq({"code"=>200, "message"=>"El contacto fue eliminado correctamente."})
      end
    end
  end
end