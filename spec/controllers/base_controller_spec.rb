require 'spec_helper'

describe "GET /" do
  
  it "renders the index page" do
    get "/"
    expect(last_response).to be_successful
  end

end

describe "GET /newsletter" do

  let(:newsletter) { "&lt;h1&gt;&lt;strong&gt;(EVENT)&lt;/strong&gt; &lt;a href='https://google.com'&gt;Intro to Web Class&lt;/a&gt;&lt;/br&gt;&lt;p&gt;The class description is here.&lt;/p&gt;&lt;/h1&gt;" }  

  it "renders the newsletter html" do
    get "/newsletter", newsletter: newsletter
    expect(last_response).to be_successful
    # pending... need to figure out how to test the string content
    # expect(last_response.body).to contain "Intro to Web Class"
  end

end

describe "POST /newsletter" do
  
  let(:params) { {fetch_meetup: true,
                fetch_external_events: true,
                fetch_jobs: true,
                gif_url: "http://awesomegif.com",
                intro: "Now revamping the newsletter!",
                article_links: [{url: "http://recode.com", description: "Awesome new post", tag: "wickedcool"}, {url: "http://newgal.com", description: "Awesome volunteer", tag: "goodread"}]} }

  def do_post
    post "/newsletter", params: params
  end

  context "with valid input" do
    
    it "redirects to the newsletter page" do
      do_post
      expect(last_response.status).to eq 302
      follow_redirect!
      expect(last_request.url).to eq "http://example.org/newsletter"
    end
  end

end
