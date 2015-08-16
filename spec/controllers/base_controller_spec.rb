require 'spec_helper'

describe "/" do
  
  it "renders the index page" do
    get "/"
    expect(last_response).to be_successful
  end

end
