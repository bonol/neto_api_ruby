require 'test_helper'

class NetoApiRubyTest < Minitest::Test

  def setup
    @neto_host_url = "host_url"
    api_key = "api_key"
    @neto = NetoApiRuby::API.new(@neto_host_url, api_key)
  end

  def test_get_all_items_first_page
    VCR.use_cassette("get_all_items_first_page") do
      response = @neto.get_products
      assert_equal 'Success', response.parsed_response['Ack']
    end
  end


  def test_get_update_items_by_time
    VCR.use_cassette("get_update_items_by_time") do
      response = @neto.get_products({
        "DateUpdatedFrom"=> ["2017-02-27 05:00:00(UTC)"]
        })
      assert_equal 'Success', response.parsed_response['Ack']
    end
  end

  def test_get_item_by_inventory_id
    VCR.use_cassette("get_item_by_inventory_id") do
      response = @neto.get_products({
        "InventoryID"=> ["101"]
        })
      assert_equal '101', response.parsed_response['Item'].first['ID']
    end
  end

  def test_create_new_item
    VCR.use_cassette("create_new_item") do
      response = @neto.create_product({
            "SKU"=> "testing sku 1",
            "Virtual"=> "True",
            "Name"=> "Test API post item sku1",
            "Brand"=> "Black Mango",
            "Description"=> "Test API post item",
            "Active"=> "True",
            "Visible"=> "True",
            "RRP"=> "100.00",
            "PromotionPrice"=> "90.00"
        })
      assert_equal 'testingsku1', response.parsed_response['Item']['SKU']
    end
  end

  def test_update_item
    VCR.use_cassette("update_single_item") do
      response = @neto.update_product({
            "SKU"=> "testingsku1",
            "RRP"=> "200.00",
            "PromotionPrice"=> "190.00"
        })
      assert_equal 'Success', response.parsed_response['Ack']
    end
  end

  def test_update_fail_wrong_sku
    VCR.use_cassette("update_fail_wrong_sku") do
      response = @neto.update_product({
            "SKU"=> "testing sku sku",
            "RRP"=> "300.00",
            "PromotionPrice"=> "290.00"
        })
      assert_equal 'Warning', response.parsed_response['Ack']
    end
  end

end
