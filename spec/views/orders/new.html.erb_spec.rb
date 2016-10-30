require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :city => "MyString",
      :phone => "MyString",
      :fullname => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_fullname[name=?]", "order[fullname]"
    end
  end
end
