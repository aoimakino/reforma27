require 'spec_helper'

describe "admins/new" do
  before(:each) do
    assign(:admin, stub_model(Admin,
      :name => "MyString",
      :last_name => "MyString",
      :pass => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admins_path, :method => "post" do
      assert_select "input#admin_name", :name => "admin[name]"
      assert_select "input#admin_last_name", :name => "admin[last_name]"
      assert_select "input#admin_pass", :name => "admin[pass]"
      assert_select "input#admin_email", :name => "admin[email]"
    end
  end
end
