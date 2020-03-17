require 'faraday'
require 'json'
require 'base64'

module Alegra
  class Setup
    attr_accessor :host, :path, :apikey, :username, :debug, :token

    def initialize(username=nil, apikey=nil, debug=false)
      @host = 'https://app.alegra.com/'
      @path = 'api/v1/'

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
      @token = ::Base64.strict_encode64("#{@username}:#{@apikey}")
    end
  end
end