require "sinatra"


get "/" do
  @name = params[:name]  
  erb :index, layout: :default
end

get "/hello" do
  "Hello Hello"
end

get "/contact" do
  # erb :contact, {:layout => :default}
  erb :contact, layout: :defalt
end
