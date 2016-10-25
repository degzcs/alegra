class Array
  def deep_camel_case_lower_keys
    [].tap { |array|
      self.each { |item| array << item.deep_camel_case_lower_keys if item.is_a? Hash }
    }
  end

  def deep_underscore_keys
    [].tap { |array|
      self.each { |item| array << item.deep_underscore_keys if item.is_a? Hash }
    }
  end
end