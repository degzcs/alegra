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
    #   - identification [ String ]
    #   - email [ String ]
    #   - phone_primary [ String ]
    #   - phone_secondary [ String ]
    #   - fax [ String ]
    #   - mobile [ String ]
    #   - observations [ String ]
    #   - ignore_repeated [ Boolean ]
    #   - price_list [ Hash ]
    #   - seller [ Hash ]
    #   - term [ Hash ]
    #   - type [ Array ]
    #   - address [ Hash ]
    #   - internal_contacts [ Array ]
    # @return [ Hash ]
    def create(params)
      _params = params.deep_camel_case_lower_keys
      client.post('contacts', _params)
    end

    # @param id [ Integer ]
    # @param params [ Hash ]
    #   - name [ String ]
    #   - identification [ String ]
    #   - email [ String ]
    #   - phone_primary [ String ]
    #   - phone_secondary [ String ]
    #   - fax [ String ]
    #   - mobile [ String ]
    #   - observations [ String ]
    #   - ignore_repeated [ Boolean ]
    #   - price_list [ Hash ]
    #   - seller [ Hash ]
    #   - term [ Hash ]
    #   - type [ Array ]
    #   - address [ Hash ]
    #   - internal_contacts [ Array ]
    # @return [ Hash ]
    def update(id, params)
      _params = params.deep_camel_case_lower_keys
      client.put("contacts/#{ id }", _params)
    end

    # @param id [ Integer ]
    # @return [ Hash ]
    def delete(id)
      client.delete("contacts/#{ id }")
    end
  end
end