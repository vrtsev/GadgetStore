require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :city => "MyString",
      :phone => "MyString",
      :fullname => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_fullname[name=?]", "order[fullname]"
    end
  end
end
