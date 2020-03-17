# frozen_string_literal: true

require 'spec_helper'

describe Alegra::Journals do
  context 'Journals' do
    before :each do
      @params = {
        username: 'ejemplo@ejemplo.com',
        apikey: '066b3ab09e72d4548e88'
      }
      @client = Alegra::Client.new(@params[:username], @params[:apikey])
    end

    it 'should get all journals' do
      VCR.use_cassette('list_of_journals') do
        journals = @client.journals.list
        expect(journals.class).to eq Array
        expect(journals).to include(simple_journal_response)
      end
    end

    it 'should retieve a journal' do
      VCR.use_cassette('simple_journal') do
        journal = @client.journals.find(191)
        expect(journal.class).to eq Hash
        expect(journal).to include(simple_journal_response)
      end
    end

    it 'should create a simple journal' do
      VCR.use_cassette('create_simple_journal') do
        params = { date: Date.today.strftime("%Y-%m-%d"),
                   client: '416',
                   entries: [{ id: '5009', debit: 3_000_000 },
                             { id: '5048', credit: 4_250_660 },
                             { id: '5008', debit: 755_000 },
                             { id: '5010', debit: 495_660 }] }

        journal = @client.journals.create(params)
        expect(journal.class).to eq Hash
        expect(journal).to include(create_journal_response)
      end
    end

    it 'should update a journal' do
      VCR.use_cassette('update_journal') do
        params = { entries: [{ id: '5009', debit: 3_000_000 },
                             { id: '5048', credit: 4_150_660 },
                             { id: '5008', debit: 655_000 },
                             { id: '5010', debit: 495_660 }] }
        journal = @client.journals.update(193, params)
        expect(journal.class).to eq Hash
        expect(journal).to include(update_journal_response)
      end
    end

    it 'should delete a journal' do
      VCR.use_cassette('delete_journal') do
        journal = @client.journals.delete(193)
        expect(journal.class).to eq Hash
        expect(journal).to eq(code: 200, message: 'El ajuste contable fue eliminado correctamente')
      end
    end
  end
end
