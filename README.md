# Alegra

A ruby client for connecting to the [Alegra](http://www.alegra.com)'s API. 

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

## Get Invoices

client.invoices.list()

## Get an specific invoice

client.invoces.find(1) # the parameter is the inovice id

## Create an Invoice
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

## Development

This gem is under construction and I'm writing it as I would like to use it. However, if you have any recommendation is well received. 

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/degzcs/alegra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributors

- Diego Gomez

