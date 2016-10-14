module Alegra
  class Contacts
    attr_reader :client

    def initialize(client)
      @client = client
    end

    # @param id [ Interger ]
    # @return [ Hash ]
    def find(id)
      client.get("contacts/#{ id }")
    end

    # Returs all contacts
    # @return [ Array ]
    def list()
      client.get('contacts')
    end

    # @param params [ Hash ]
    #   - name [ String ]
    # @return [ Hash ]
    def create(params)
      _params = params.deep_camel_case_lower_keys
      client.post('contacts', _params)
    end
  end
end