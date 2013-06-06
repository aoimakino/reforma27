require 'spec_helper'

describe "client_services/new" do
  before(:each) do
    assign(:client_service, stub_model(ClientService,
      :client_id => "MyString",
      :service_id => "MyString"
    ).as_new_record)
  end

  it "renders new client_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => client_services_path, :method => "post" do
      assert_select "input#client_service_client_id", :name => "client_service[client_id]"
      assert_select "input#client_service_service_id", :name => "client_service[service_id]"
    end
  end
end
