module Alegra
  class Invoices
    attr_reader :client

    def initialize(client)
      @client = client
    end

    # @return [ Hash ]
    def find(id)
      client.get("invoices/#{ id }")
    end

    # Returs all invoices
    # @return [ Hash ]
    #
    def list()
      client.get("invoices")
    end

    # Creates a invoice
    def create()
      # not implemented yet!
    end
  end
end