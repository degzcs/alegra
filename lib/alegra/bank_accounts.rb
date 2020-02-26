module Alegra
  class BankAccounts < Alegra::Record
    def list(options = { format: :formated })
      client.get('bank-accounts', {}, options)
    end

    def find(id, options = { format: :formated })
      client.get("bank-accounts/#{id}", {}, options)
    end

    def create(params, options = { format: :formated })
      params = params.deep_camel_case_lower_keys
      client.post('bank-accounts', params, options)
    end

    def transfer(id, params, options = { format: :formated })
      params = params.deep_camel_case_lower_keys
      client.post("bank-accounts/#{id}/transfer", params, options)
    end
  end
end
