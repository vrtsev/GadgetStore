require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :city => "City",
      :phone => "Phone",
      :fullname => "Fullname"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Fullname/)
  end
end
