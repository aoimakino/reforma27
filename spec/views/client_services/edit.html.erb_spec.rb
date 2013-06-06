require 'spec_helper'

describe "client_services/edit" do
  before(:each) do
    @client_service = assign(:client_service, stub_model(ClientService,
      :client_id => "MyString",
      :service_id => "MyString"
    ))
  end

  it "renders the edit client_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => client_services_path(@client_service), :method => "post" do
      assert_select "input#client_service_client_id", :name => "client_service[client_id]"
      assert_select "input#client_service_service_id", :name => "client_service[service_id]"
    end
  end
end
