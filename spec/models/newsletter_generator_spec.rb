require "spec_helper"

describe NewsletterGenerator do

  let(:options) { {fetch_meetups: true,
                fetch_events: true,
                fetch_jobs: true,
                gif_url: "http://awesomegif.com",
                intro: "Now revamping the newsletter!",
                articles: [{url: "http://recode.com", description: "Awesome new post", tag: "wickedcool"}, {url: "http://newgal.com", description: "Awesome volunteer", tag: "goodread"}]} }
  
  context "with valid inputs" do

    it "creates a newsletter without an error" do
      expect{ NewsletterGenerator.new(options) }.not_to raise_error
    end

    describe "upon creation" do

      before { @newsletter = NewsletterGenerator.new(options) }
      
      it "sets the option values" do
        expect(@newsletter.fetch_meetups).to be_true
        expect(@newsletter.fetch_events).to be_true
        expect(@newsletter.fetch_jobs).to be_true
      end

      it "creates the gif object" do
        expect(@newsletter.gif).to be_an_instance_of Gif
      end

      it "generates a collection articles" do
        expect(@newsletter.articles).to be_an_instance_of Array
        expect(@newsletter.articles.first).to be_an_instance_of Article
      end
        
    end
  end

end
