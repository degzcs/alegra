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
    # @return [ Array ]
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
    def update(id, params)
      _params = params.deep_camel_case_lower_keys
      client.put("invoices/#{ id }", _params)
    end

    # @param id [ Integer ]
    # @param params [ Hash ]
    #  - emails [ Array ]
    #  - send_copy_to_user [ Boolean ]
    #  - invoiceType [ String ]
    # @return [ Hash ]
    def send_by_email(id, params)
      _params = params.deep_camel_case_lower_keys
      client.post("invoices/#{ id }/email", _params)
    end
  end
end

