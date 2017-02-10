require 'test_helper'

class NetoApiRubyTest < Minitest::Test
  def setup
  	@neto_host_url = "host_url"
  	api_key = "api_key"
  	@neto = NetoApiRuby::API.new(@neto_host_url, api_key)
  end
  # def test_that_it_has_a_version_number
  #   refute_nil ::NetoApiRuby::VERSION
  # end
  def test_get_all_items_first_page
  	response = @neto.get_products
  	assert_equal false, response.parsed_response['Item'].nil?
  end

  def test_get_first_item_id
  	response = @neto.get_products({
  		"InventoryID"=> ["100"]
  		})
  	assert_equal '100', response.parsed_response['Item'].first['ID']
  end
end
