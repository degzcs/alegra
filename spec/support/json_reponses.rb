module JsonReponses
  def invoice1_response
    JSON.parse(File.read('./spec/fixtures/invoice1.json'))
  end

  def invoice2_response
    JSON.parse(File.read('./spec/fixtures/invoice2.json'))
  end
end