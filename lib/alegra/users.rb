module Alegra
  class Users < Alegra::Record
    def list(options = { format: :formated })
      client.get('users', {}, options)
    end

    def find(id, options = { format: :formated })
      client.get("users/#{id}", {}, options)
    end

    def find_current(options = { format: :formated })
      client.get('users/self', {}, options)
    end
  end
end
