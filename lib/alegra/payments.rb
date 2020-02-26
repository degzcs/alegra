module Alegra
  class Payments < Alegra::Record
    # @param id [ Integer ]
    # @return [ Hash ]
    def find(id)
      client.get("payments/#{id}")
    end

    # Returs all payments
    # @param params [ Hash ]
    #   - start [ Integer ]
    #   - limit [ Integer ]
    #   - order_direction [ String ]
    #   - order_field [ string ]
    #   - type [ Integer ]
    #   - metadata [ Boolean ]
    #   - id [ Integer ]
    # @return [ Array ]
    def list(params = {})
      client.get('payments', params)
    end

    # Creates a payment
    # @param params [ Hash ]
    #   - date [ String ]
    #   - bank_account [ Integer ] or [ Hash ]
    #   - payment_method [ String ]
    #   - observations [ String  ]
    #   - anotation [ String ]
    #   - type [ String ]
    #   - client [ Integer ] or [ Hash ]
    #   - invoices [ Array ]
    #   - bills [ Array ]
    #   - categories [ Array ]
    #   - retentions [ Array ]
    #   - currency [ Array ]
    # @return [ Hash ]
    def create(params)
      sanitize_params = params.deep_camel_case_lower_keys
      client.post('payments', sanitize_params)
    end

    # Update a payment
    # @param id [ Integer ]
    # @param params [ Hash ]
    #   - date [ String ]
    #   - bank_account [ Integer ] or [ Hash ]
    #   - payment_method [ String ]
    #   - observations [ String  ]
    #   - anotation [ String ]
    #   - type [ String ]
    #   - client [ Integer ] or [ Hash ]
    #   - invoices [ Array ]
    #   - bills [ Array ]
    #   - categories [ Array ]
    #   - retentions [ Array ]
    #   - currency [ Array ]
    # @return [ Hash ]
    def update(id, params)
      sanitize_params = params.deep_camel_case_lower_keys
      client.put("payments/#{id}", sanitize_params)
    end

    # @param id [ Integer ]
    # @return [ Hash ]
    def delete(id)
      client.delete("payments/#{id}")
    end
  end
end
