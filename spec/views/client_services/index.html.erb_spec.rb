require 'spec_helper'

describe "client_services/index" do
  before(:each) do
    assign(:client_services, [
      stub_model(ClientService,
        :client_id => "Client",
        :service_id => "Service"
      ),
      stub_model(ClientService,
        :client_id => "Client",
        :service_id => "Service"
      )
    ])
  end

  it "renders a list of client_services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "Service".to_s, :count => 2
  end
end
