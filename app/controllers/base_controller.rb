get '/' do
  erb :index
end

post '/newsletter' do
  @newsletter = NewsletterGenerator.new(params).newsletter
  erb(:newsletter)
end
