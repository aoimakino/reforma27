require 'spec_helper'

describe "services/index" do
  before(:each) do
    assign(:services, [
      stub_model(Service,
        :name => "Name",
        :price => "Price",
        :tax => "Tax"
      ),
      stub_model(Service,
        :name => "Name",
        :price => "Price",
        :tax => "Tax"
      )
    ])
  end

  it "renders a list of services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Tax".to_s, :count => 2
  end
end
