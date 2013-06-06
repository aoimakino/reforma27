require 'spec_helper'

describe "admins/show" do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      :name => "Name",
      :last_name => "Last Name",
      :pass => "Pass",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Pass/)
    rendered.should match(/Email/)
  end
end
