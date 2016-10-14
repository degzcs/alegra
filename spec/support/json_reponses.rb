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

  #
  # Contact Reponses
  #

  def simple_contact_response
    JSON.parse(File.read('./spec/fixtures/simple_contact_response.json'))
  end

  def contacts_group_response
    JSON.parse(File.read('./spec/fixtures/contacts_group_response.json'))
  end

  def create_contact_response
    JSON.parse(File.read('./spec/fixtures/create_contact_response.json'))
  end

  def create_completed_contact_response
    JSON.parse(File.read('./spec/fixtures/create_completed_contact_response.json'))
  end
end