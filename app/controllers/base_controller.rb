get '/' do
  erb :index
end

get '/newsletter' do
  @newsletter = params[:newsletter]
  erb :newsletter
end

post '/newsletter' do
  redirect "/newsletter"
end
