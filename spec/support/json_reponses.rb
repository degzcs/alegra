module JsonReponses
  #
  # Invoice reponses
  #

  def simple_invoice_response
    JSON.parse(File.read('./spec/fixtures/simple_invoice_response.json'))
  end

  def create_invoice_response
    JSON.parse(File.read('./spec/fixtures/create_invoice_response.json'))
  end

  def invoices_group_response
    JSON.parse(File.read('./spec/fixtures/invoices_group_response.json'))
  end

  def update_invoice_response
    JSON.parse(File.read('./spec/fixtures/update_invoice_response.json'))
  end

end