module Alegra
  class Invoices
    attr_reader :client

    def initialize(client)
      @client = client
    end

    # @param id [ Integer ]
    # @return [ Hash ]
    def find(id)
      client.get("invoices/#{id}")
    end

    # Returs all invoices
    # @param params [ Hash ]
    #   - start [ Integer ]
    #   - limit [ Integer ]
    #   - order_direction [ String ]
    #   - order_field [ string ]
    #   - metadata [ Boolean ]
    #   - id [ Integer ]
    #   - date [ String  ]
    #   - due_date [ String ]
    #   - status [ String ]
    #   - client_name [ String ]
    #   - client_identification [ String ]
    #   - number_template_full_number
    # @return [ Array ]
    def list(params = {})
      client.get('invoices', params)
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
      sanitize_params = params.deep_camel_case_lower_keys
      client.post('invoices', sanitize_params)
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
      sanitize_params = params.deep_camel_case_lower_keys
      client.put("invoices/#{id}", sanitize_params)
    end

    # @param id [ Integer ]
    # @param params [ Hash ]
    #  - emails [ Array ]
    #  - send_copy_to_user [ Boolean ]
    #  - invoiceType [ String ]
    # @return [ Hash ]
    def send_by_email(id, params)
      sanitize_params = params.deep_camel_case_lower_keys
      client.post("invoices/#{id}/email", sanitize_params)
    end
  end
end

