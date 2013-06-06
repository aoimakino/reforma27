require 'spec_helper'

describe "authentications/index" do
  before(:each) do
    assign(:authentications, [
      stub_model(Authentication,
        :email => "Email",
        :pass => "Pass"
      ),
      stub_model(Authentication,
        :email => "Email",
        :pass => "Pass"
      )
    ])
  end

  it "renders a list of authentications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Pass".to_s, :count => 2
  end
end
