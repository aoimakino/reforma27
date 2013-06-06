require 'spec_helper'

describe "authentications/edit" do
  before(:each) do
    @authentication = assign(:authentication, stub_model(Authentication,
      :email => "MyString",
      :pass => "MyString"
    ))
  end

  it "renders the edit authentication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => authentications_path(@authentication), :method => "post" do
      assert_select "input#authentication_email", :name => "authentication[email]"
      assert_select "input#authentication_pass", :name => "authentication[pass]"
    end
  end
end
