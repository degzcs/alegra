module Alegra
  class Categories < Alegra::Record
    def list(params = {}, options = { format: :formated })
      client.get('categories', params, options)
    end

    def find(id, options = { format: :formated })
      client.get("categories/#{id}", {}, options)
    end
  end
end
