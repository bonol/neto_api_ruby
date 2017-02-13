require 'test_helper'

class NetoApiRubyTest < Minitest::Test
  def setup
  	@neto_host_url = "https://hoh-trail.neto.com.au/do/WS/NetoAPI"
  	api_key = "QQCVQdiHnE2uNoGup3SASCA3sPlqO1e1"
  	@neto = NetoApiRuby::API.new(@neto_host_url, api_key)
  end
  # def test_that_it_has_a_version_number
  #   refute_nil ::NetoApiRuby::VERSION
  # end
  def test_get_all_items_first_page
  	response = @neto.get_products
  	assert_equal false, response.parsed_response['Item'].nil?
  end

  def test_get_item_by_inventory_id
  	response = @neto.get_products({
  		"InventoryID"=> ["101"]
  		})
  	assert_equal '101', response.parsed_response['Item'].first['ID']
  end
end
