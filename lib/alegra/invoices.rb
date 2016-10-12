module Alegra
  class Invoices
    attr_reader :client

    def initialize(client)
      @client = client
    end

    # @param id [ Interger ]
    # @return [ Hash ]
    def find(id)
      client.get("invoices/#{ id }")
    end

    # Returs all invoices
    # @return [ Hash ]
    def list()
      client.get('invoices')
    end

    # Creates a invoice
    # @param params [ Hash ]
    #   - date [ String ]
    #   - due_date [ String ]
    #   - price_list [ Array ]
    #   - currency [ Array ]
    #   - payments [ Array ]
    #   - client [ Integer ] or [ Hash ]
    #   - items [ Array ]
    #   - observations [ Array ]
    #   - anotations [ Array ]
    #   - terms_conditions [ Array ]
    #   - status [ String ]
    #   - number_template [ String ]
    #   - retenctions [ Array ]
    #   - seller [ String ]
    # @return [ Hash ]
    def create(params)
      _params = params.deep_camel_case_lower_keys
      client.post('invoices', _params)
    end
  end
end

