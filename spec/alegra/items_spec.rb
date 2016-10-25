require 'spec_helper'

describe Alegra::Items do
  context 'Items' do
    before :each do
      @params = {
        username: 'ejemploapi@dayrep.com',
        apikey: '066b3ab09e72d4548e88'
      }
    end

    it 'should get all items' do
      VCR.use_cassette('list_of_items') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        items = client.items.list()
        expect(items.class).to eq Array
        expect(items).to eq items_group_response
      end
    end

    it 'should get a specific item by id' do
      VCR.use_cassette('simple_item') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        item = client.items.find(1)
        expect(item.class).to eq Hash
        expect(item).to eq simple_item_response
      end
    end

    it 'should create an item' do
      VCR.use_cassette('create_item') do
        _params = {
                 name: "leather",
                 description: "Brown leather wallet",
                 reference: "CAR-195",
                 category: {
                                id: 1
                                },
                 inventory:
                    {
                        unit: "piece",
                        unit_cost: 2560,
                        initial_quantity: 160
                    },
                tax: [
                    {
                        id: 3
                    }
                ],
                price:
                    [
                        {
                            price: 4050
                        },
                    ]
                }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        item = client.items.create(_params)
        expect(item.class).to eq Hash
        expect(item).to include(create_item_response)
      end
    end

    it 'should update an item' do
      VCR.use_cassette('update_item') do
        _params = {
                 name: "new name leather",
                 description: "Brown leather wallet with more details",
                }
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        item = client.items.update(3, _params)
        expect(item.class).to eq Hash
        expect(item).to include(update_item_response)
      end
    end

    it 'should delete an item' do
      VCR.use_cassette('delete_item') do
        client = Alegra::Client.new(@params[:username], @params[:apikey])
        item = client.items.delete(3)
        expect(item.class).to eq Hash
        expect(item).to include({"code"=>200, "message"=>"El ítem fue eliminado correctamente."})
      end
    end
  end
end