require 'alegra/setup'
require 'alegra/request'
require 'alegra/invoices'
require 'alegra/contacts'
require 'alegra/items'
require 'alegra/payments'

module Alegra
  class Client
    def initialize(username=nil, apikey=nil, debug=false)
      @setup = Alegra::Setup.new(username, apikey, debug)
    end

    def get(url, params = {})
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.get(url, params)
    end

    def post(url, params = {})
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.post(url, params)
    end

    def put(url, params={})
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.put(url, params)
    end

    def delete(url, params={})
      request = Alegra::Request.new(@setup.host, @setup.path, @setup.token)
      request.delete(url, params)
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
  end
end
