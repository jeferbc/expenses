require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "Category should have a name" do
    @category = Category.new
    assert_not @category.save
  end

end
