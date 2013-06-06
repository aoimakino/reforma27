require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => 1,
      :depto => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_last_name", :name => "client[last_name]"
      assert_select "input#client_email", :name => "client[email]"
      assert_select "input#client_phone", :name => "client[phone]"
      assert_select "input#client_depto", :name => "client[depto]"
    end
  end
end
