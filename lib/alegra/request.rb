require 'alegra/response'
module Alegra
  class Request
    attr_accessor :path, :token, :session

    def initialize(host, path, token=nil)
      @token = token
      @path = path
      @session = Faraday.new url: host
    end

    def get(url, params = {}, options = { format: :formated })
      params = URI.encode_www_form(params)

      response = @session.get do |req|
        req.url "#{@path}#{url}?#{params}"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@token}"
      end
      response_of_request(response, options)
    end

    def post(url, params = {}, options = { format: :formated })
      params = JSON.generate(params)
      response = @session.post do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      response_of_request(response, options)
    end

    def put(url, params={}, options = { format: :formated })
      params = JSON.generate(params)
      response = @session.put do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      response_of_request(response, options)
    end

    def delete(url, params={}, options = { format: :formated })
      params = JSON.generate(params)
      response = @session.delete do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      response_of_request(response, options)
    end

    private

    def response_of_request(response, options = { format: :formated })
      cast_error(response, options) unless response.status == 200 || response.status == 201

      raise_invalid_format options[:format]

      return response if options[:format] == :raw

      Alegra::Response.new(response.body).call
    end

    def cast_error(response, options = { format: :formated })
      raise_invalid_format options[:format]

      return response if options[:format] == :raw

      message = response.body.empty? ? response.body : Alegra::Response.new(response.body).call['message']

      error_map = {
        500 => 'Sever error! Something were wrong in the server.',
        400 => "Bad request!, #{ message }",
        401 => 'Authentication error!',
        402 => 'Required payment!',
        403 => 'Restricted access!',
        404 => 'Not found!',
        405 => 'Operation does not allowed!',
      }
      raise StandardError, "Status: #{ response.status }. Error: #{ error_map[response.status] }"
    end

    def raise_invalid_format(format)
      return if %i[formated raw].include?(format)
      return if format.nil?

      raise StandardError, "#{format} is not a valid format, valid_formats[:formated, :raw]"
    end
  end
end
