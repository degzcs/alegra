module Alegra
  class Request
    attr_accessor :path, :token, :session

    def initialize(host, path, token=nil)
      @token = token
      @path = path
      @session = Faraday.new url: host
    end

    def get(url, params={})
        params = JSON.generate(params)
        response = @session.get do |req|
          req.url "#{ @path }#{ url }"
          req.headers['Content-Type'] = 'application/json'
          req.headers['Accept'] = 'application/json'
          req.headers['Authorization'] = "Basic #{ @token }"
        end
        cast_error(response) unless (response.status == 200 || response.status == 201)
        return JSON.parse(response.body)
    end

    def post(url, params={})
        params = JSON.generate(params)
        response = @session.post do |req|
          req.url "#{ @path }#{ url }"
          req.headers['Content-Type'] = 'application/json'
          req.headers['Accept'] = 'application/json'
          req.headers['Authorization'] = "Basic #{ @token }"
          req.body = params
        end
        cast_error(response) unless (response.status == 200 || response.status == 201)
        return JSON.parse(response.body)
    end

    def cast_error(response)
      error_map = {
        500 => 'Sever error! Something were wrong in the server.',
        400 => "Bad request!, #{ JSON.parse(response.body)['message'] }",
        401 => 'Authentication error!',
        402 => 'Required payment!',
        403 => 'Restricted access!',
        403 => 'Not found!',
        403 => 'Operation does not allowed!',
      }
      raise StandardError, "Status: #{ response.status }. Error: #{ error_map[response.status] }"
    end
  end
end