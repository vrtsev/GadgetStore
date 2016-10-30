require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :name => "Name",
        :price => 2.5,
        :description => "MyText",
        :available => false
      ),
      Item.create!(
        :name => "Name",
        :price => 2.5,
        :description => "MyText",
        :available => false
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
