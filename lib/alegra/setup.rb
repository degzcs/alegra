require 'faraday'
require 'json'

module Alegra
  class Setup
    attr_accessor :host, :path, :apikey, :username, :debug, :session, :token

    def initialize(username=nil, apikey=nil, debug=false)
      @host = 'https://app.alegra.com/'
      @path = 'api/v1/'

      @session = Faraday.new url: @host
      @debug = debug

      if not apikey
        if ENV['ALEGRA_APIKEY']
          @apikey = ENV['ALEGRA_APIKEY']
        else
          raise 'set up the ALEGRA_APIKEY environment variable'
          # apikey = read_configs
        end
      end

      if not username
        if ENV['ALEGRA_USERNAME']
          @username = ENV['ALEGRA_USERNAME']
        else
          raise 'set up the ALEGRA_USERNAME environment variable'
          # apikey = read_configs
        end
      end

      raise Error, 'You must provide a ALEGRA API key' if not apikey
      raise Error, 'You must provide a ALEGRA USERNAME' if not username
      @apikey = apikey
      @username = username
      create_token!
    end

    def create_token!
      @token = Base64.encode64("#{@username}:#{@apikey}")
    end

    def call(url, params={})
        params[:key] = @apikey
        params = JSON.generate(params)

        response = @session.post do |req|
          req.url "#{@path}#{url}.json"
          req.headers['Content-Type'] = 'application/json'
          req.headers['Accept'] = 'application/json'
          req.body params
        end

        # cast_error(r.body) if r.status != 200
        return JSON.parse(response.body)
    end
  end
end