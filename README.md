# Alegra
[![Build Status](https://travis-ci.org/degzcs/alegra.svg?branch=master)](https://travis-ci.org/degzcs/alegra)

A ruby client for connecting to [Alegra](http://www.alegra.com)'s API.

Please check the official API documentation [here](http://developer.alegra.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alegra'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install alegra

## Usage

```ruby

require 'alegra'
client = Alegra::Client.new('youremail@test.com', 'your-private-token')
```

### Contacts

You can list all your contacts:
```ruby
client.contacts.list()
```

Get a specific contact by id:

```ruby
client.contacts.find(1)
```

And you can create a contact as well:

```ruby
params = {
  name: 'Alan Britho'
}
client.contacts.create(params)
```

You can update this contact too:
```ruby
params = {
  name: 'Sinc Hompas'
}
client.contacts.update(1, params)
```

Or delete it, as follows:
```ruby
client.contacts.delete(1)
```

### Items

You can list all your items:
```ruby
client.items.list()
```

Get a specific item by id:

```ruby
client.items.find(1)
```

And you can create an item as well:

```ruby
params = {
  name: 'a new item',
  price: 1500
}
client.items.create(params)
```

You can update this item too:
```ruby
params = {
  name: 'A better name!',
}
client.items.update(1, params)
```

Or delete it, as follows:
```ruby
client.items.delete(1)
```

### Invoices

You can get all invoices:
```ruby
client.invoices.list()
```

Or get a specific invoice by id:
```ruby
client.invoices.find(1) # the parameter is the inovice id
```

Also you are able to create a new invoice, as follows:
```ruby
params = {
          date: '2016-10-12',
          due_date: '2016-10-12',
          client: 1,
          items: [
                    {
                        id: 1,
                        price: 40,
                        quantity: 5
                    },
                    {
                        id: 2,
                        description: 'Brown leather wallet',
                        price: 80,
                        discount: 10,
                        tax: [
                                {
                                    id: 3,
                                }
                             ],
                        quantity: 1
                    }
                  ],
          account_number: 1234,
          payment_method: 'cash',
          stamp: {
            generate_stamp: true
          },
        }

client.invoices.create(params)
```

Update that invoice:
```ruby
params = { observations: 'This invoice was updated!'}
client.invoices.update(1, params)
```

Send that invoice by email:
```ruby
params = { emails: ['your.email@alegra.com', 'another.eail@algra.com'], send_copy_to_user: true, invoice_type: 'copy'}
client.invoices.send_by_email(1, params)
```

### Payments

You can get all payments:
```ruby
client.payments.list()
```

Or get a specific payment by id:
```ruby
client.payments.find(1) # the parameter is the payment id
```

Also you are able to create a new payments, as follows:
```ruby
params = {
  date: "2015-12-13",
  invoices: [
    {
      id: 6,
      amount: 150
    },
    {
      id: 200,
      amount: 500
    }
  ],
  bank_account: 1
}

client.payments.create(params)
```

## Development

This gem is under construction and I'm writing it with the goal that it will easy to use. However, if you have any recommendation is well received.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/degzcs/alegra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## TODO
The next endpoints are pending:

- Estimates
- Number templates
- Retentions
- Categories
- Sellers
- payments
  - cancel payment(void)
  - open payment convert  https://developer.alegra.com/docs/convertir-pago-a-abierto
  - Add attachment https://developer.alegra.com/docs/adjuntar-archivos-a-pagos

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributors

- Diego Gomez
- Nicolas Mena