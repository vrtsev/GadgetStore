require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :city => "City",
        :phone => "Phone",
        :fullname => "Fullname"
      ),
      Order.create!(
        :city => "City",
        :phone => "Phone",
        :fullname => "Fullname"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
  end
end
