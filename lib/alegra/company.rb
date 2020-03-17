module Alegra
  class Company < Alegra::Record
    def find(options = { format: :formated })
      client.get('company', {}, options)
    end

    def update(params, options = { format: :formated })
      sanitize_params = params.deep_camel_case_lower_keys
      client.put('company', sanitize_params, options)
    end
  end
end
