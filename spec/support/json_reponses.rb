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

  def update_contact_response
    JSON.parse(File.read('./spec/fixtures/update_contact_response.json'))
  end

  #
  # Item Responses
  #

  def items_group_response
    JSON.parse(File.read('./spec/fixtures/items_group_response.json'))
  end

  def simple_item_response
    JSON.parse(File.read('./spec/fixtures/simple_item_response.json'))
  end

  def create_item_response
    JSON.parse(File.read('./spec/fixtures/create_item_response.json'))
  end

  def update_item_response
    JSON.parse(File.read('./spec/fixtures/update_item_response.json'))
  end
end