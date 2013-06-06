require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :depto => "Depto"
      ),
      stub_model(Client,
        :name => "Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1,
        :depto => "Depto"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Depto".to_s, :count => 2
  end
end
