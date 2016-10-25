module Alegra
  module Formatters
    class UnderscoreFormatter
      attr_accessor :original_content, :formatted_content

      def initialize
        @original_content = ''
      end
      def call(options={})
        original_content = options[:content]
        @formatted_content = original_content.deep_underscore_keys
      end
    end
  end
end