require 'alegra/setup'
require 'alegra/request'
require 'alegra/record'
require 'alegra/invoices'
require 'alegra/contacts'
require 'alegra/items'
require 'alegra/payments'
require 'alegra/company'
require 'alegra/users'
require 'alegra/categories'
require 'alegra/bank_accounts'
require 'alegra/journals'

module Alegra
  class Client
    def initialize(username=nil, apikey=nil, debug=false)
      @setup = Alegra::Setup.new(username, apikey, debug)
    end

    def get(url, params = {}, options = { format: :formated })
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.get(url, params, options)
    end

    def post(url, params = {}, options = { format: :formated })
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.post(url, params, options)
    end

    def put(url, params={}, options = { format: :formated })
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.put(url, params, options)
    end

    def delete(url, params={}, options = { format: :formated })
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.delete(url, params, options)
    end

    def contacts
      Alegra::Contacts.new(self)
    end

    def invoices
      Alegra::Invoices.new(self)
    end

    def items
      Alegra::Items.new(self)
    end

    def payments
      Alegra::Payments.new(self)
    end

    def company
      Alegra::Company.new(self)
    end

    def users
      Alegra::Users.new(self)
    end

    def categories
      Alegra::Categories.new(self)
    end

    def bank_accounts
      Alegra::BankAccounts.new(self)
    end

    def journals
      Alegra::Journals.new(self)
    end
  end
end
