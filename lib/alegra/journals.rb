module Alegra
  class Journals < Alegra::Record
    def find(id)
      client.get("journals/#{id}")
    end

    def list(params = {})
      client.get('journals', params)
    end

    def create(params)
      params = params.deep_camel_case_lower_keys
      client.post('journals', params)
    end

    def update(id, params)
      params = params.deep_camel_case_lower_keys
      client.put("journals/#{id}", params)
    end

    def delete(id)
      client.delete("journals/#{id}")
    end
  end
end
