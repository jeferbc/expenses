require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase

  test "Purchase should have a name" do
    @purchase = Purchase.new
    assert_not @purchase.save
  end

end
