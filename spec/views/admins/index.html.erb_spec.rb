require 'spec_helper'

describe "admins/index" do
  before(:each) do
    assign(:admins, [
      stub_model(Admin,
        :name => "Name",
        :last_name => "Last Name",
        :pass => "Pass",
        :email => "Email"
      ),
      stub_model(Admin,
        :name => "Name",
        :last_name => "Last Name",
        :pass => "Pass",
        :email => "Email"
      )
    ])
  end

  it "renders a list of admins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Pass".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
