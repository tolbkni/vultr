require 'test/test_helper'

class VultrIsoTest < Minitest::Test

  def setup
    Vultr.api_key = ENV['VULTR_API_KEY']
  end

  def test_iso_list_url
    iso_list_url = 'https://api.vultr.com/v1/iso/list?api_key=' + Vultr.api_key
    assert_equal iso_list_url, Vultr::ISO._list
  end

  def test_iso_list_response
    r = Vultr::ISO.list

    assert r.has_key? :status
    assert r[:status], 200

    assert r.has_key? :result
    assert_instance_of Hash, r[:result]
  end

  def teardown
    # Do nothing
  end
end