require 'alegra/response'
module Alegra
  class Request
    attr_accessor :path, :token, :session

    def initialize(host, path, token=nil)
      @token = token
      @path = path
      @session = Faraday.new url: host
    end

    def get(url, params = {})
      params = URI.encode_www_form(params)

      response = @session.get do |req|
        req.url "#{@path}#{url}?#{params}"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@token}"
      end

      cast_error(response) unless response.status == 200 || response.status == 201
      Alegra::Response.new(response.body).call
    end

    def post(url, params = {})
      params = JSON.generate(params)
      response = @session.post do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      cast_error(response) unless (response.status == 200 || response.status == 201)
      return Alegra::Response.new(response.body).call
    end

    def put(url, params={})
      params = JSON.generate(params)
      response = @session.put do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      cast_error(response) unless (response.status == 200 || response.status == 201)
      return Alegra::Response.new(response.body).call
    end


    def delete(url, params={})
      params = JSON.generate(params)
      response = @session.delete do |req|
        req.url "#{ @path }#{ url }"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{ @token }"
        req.body = params
      end
      cast_error(response) unless (response.status == 200 || response.status == 201)
      return Alegra::Response.new(response.body).call
    end

    def cast_error(response)
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
  end
end