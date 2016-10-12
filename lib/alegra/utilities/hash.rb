class Hash
  def deep_camel_case_lower_keys(hash=self)
    {}.tap { |h|
      hash.each { |key, value| h[transform_key(key)] = map_value(value) }
    }
  end

  def map_value(thing)
    case thing
    when Hash
      deep_camel_case_lower_keys(thing)
    when Array
      thing.map { |v| map_value(v) }
    else
      thing
    end
  end

  def transform_key(key)
    key.to_s.split('_').inject([]){ |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join.to_sym
  end
end