require 'test_helper'

class ExpensesFlowTest < Capybara::Rails::TestCase
  def setup
    @one = expenses(:one)
  end

  test 'expenses index' do
    visit '/expenses'
    assert page.has_content?(@one.id)
  end

end
