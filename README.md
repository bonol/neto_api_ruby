# Neto API in Ruby

A thin Ruby wrapper for connecting to NETO REST API. Easily interact with the NETO API using this library.

## Installation

    $ gem install neto_api_ruby

## Getting started

Generate API credentials (API secure key) following this instructions 
https://www.neto.com.au/api
API endpoints, filters and output selector can also be found on the page above.

## Setup

Setup for the new NETO API integration:
```ruby
require "neto_api_ruby"

neto = NetoApiRuby::API.new(neto_host_url, api_key)
```

##Methods

|   Params   |   Type   |                         Description                          | 		Example				 |
| ---------- | -------- | ------------------------------------------------------------ | --------------------------- |
| `query`    | `Hash`   | For get products, data field filter should be specified.     | {"InventoryID"=> ["100"]}   |
|            |          | By default IsActive Filter is specified.                     | 							 |

### get_products
- `.get_products(query)`

#### Response

All methods will return [HTTParty::Response](https://github.com/jnunemaker/httparty) object.

## Release History
- 2017-02-08 - 0.0.1 - Beta release. Nothing will be there in the gem until version goes up to 0.1.1


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bonogit/neto_api_ruby. This project is for my own neto integration use. It also intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

