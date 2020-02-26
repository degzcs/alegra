module Alegra
  class Contacts < Alegra::Record
    # @param id [ Integer ]
    # @return [ Hash ]
    def find(id)
      client.get("contacts/#{ id }")
    end

    # Returs all contacts
    # @param params [ Hash ]
    #   - start [ Integer ]
    #   - limit [ Integer ]
    #   - order_direction [ String ]
    #   - order_field [ string ]
    #   - query [ String ]
    #   - type [ Integer ]
    #   - metadata [ Boolean ]
    #   - name [ String ]
    #   - identification [ String ]
    # @return [ Array ]
    def list(params = {})
      client.get('contacts', params)
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
      params = params.deep_camel_case_lower_keys
      client.post('contacts', params)
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
      sanitize_params = params.deep_camel_case_lower_keys
      client.put("contacts/#{id}", sanitize_params)

    end

    # @param id [ Integer ]
    # @return [ Hash ]
    def delete(id)
      client.delete("contacts/#{id}")
    end
  end
end
