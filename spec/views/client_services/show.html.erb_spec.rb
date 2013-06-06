require 'spec_helper'

describe "client_services/show" do
  before(:each) do
    @client_service = assign(:client_service, stub_model(ClientService,
      :client_id => "Client",
      :service_id => "Service"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client/)
    rendered.should match(/Service/)
  end
end
