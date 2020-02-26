module Alegra
  class Items < Alegra::Record
    # @param id [ Integer ]
    # @return [ Hash ]
    def find(id)
      client.get("items/#{ id }")
    end

    # Return all items
    # @return [ Array ]
    def list()
      client.get('items')
    end

    # @param params [ Hash ]
    # @return [ Hash ]
    #       - name [ String ]
    #       - description [ String ]
    #       - reference [ String ]
    #       - price [ Array ]
    #       - category [ Hash ]
    #       - inventory [ Hash ]
    #       - tax [ Array ]
    def create(params)
      _params = params.deep_camel_case_lower_keys
      client.post('items', _params)
    end

    # @param id [ Integer ]
    # @param params [ Hash ]
    # @return [ Hash ]
    #       - name [ String ]
    #       - description [ String ]
    #       - reference [ String ]
    #       - price [ Array ]
    #       - category [ Hash ]
    #       - inventory [ Hash ]
    #       - tax [ Array ]
    def update(id, params)
      _params = params.deep_camel_case_lower_keys
      client.put("items/#{ id }", _params)
    end

    # @param id [ Integer ]
    # @return [ Hash ]
    def delete(id)
      client.delete("items/#{ id }")
    end
  end
end
