require 'spec_helper'

describe HtmlCleaner do

  describe "#clean" do

    it "cleans a single line of html" do
      bad_string =  "<h1>Test Headline</h1>"
      clean_string = "&lt;h1&gt;Test Headline&lt;/h1&gt;"
      expect(HtmlCleaner.clean(bad_string)).to eq clean_string
    end
    
    it "cleans a snippet of html with a web link" do
      bad_string = "<h1><strong>(EVENT)</strong> <a href='https://google.com'>Intro to Web Class</a></br><p>The class description is here.</p></h1>"
      clean_string = "&lt;h1&gt;&lt;strong&gt;(EVENT)&lt;/strong&gt; &lt;a href='https://google.com'&gt;Intro to Web Class&lt;/a&gt;&lt;/br&gt;&lt;p&gt;The class description is here.&lt;/p&gt;&lt;/h1&gt;"
      expect(HtmlCleaner.clean(bad_string)).to eq clean_string
    end

    it "returns an empty string when given empty string" do
      expect(HtmlCleaner.clean("")).to eq ""
    end

  end

end
