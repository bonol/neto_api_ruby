$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'neto_api_ruby'
require 'json'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'


VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassetes'
  config.hook_into :webmock
end

