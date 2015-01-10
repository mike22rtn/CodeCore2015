#installing Pony
#data_mapper
#dm-sqlite-adapter
#fdsafs

require "sinatra"
require "pony"
require "data_mapper"

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/contact.db")

class Contact
	include DataMapper::Resource

	property :id, Serial # make id integer with autoincrement and its primary key
	property :name, String
	property :email, String
	property :message, Text
	property :phone_number, String

end

Contact.auto_upgrade!

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

post "/contact" do
		Contact.create(name: params[name:],
					message: params[message],
					email: params[email],
					phone_number: params[phone_number])
	Pony.mail(to: "m.renton22@gmail.com",
				subject: "#{params[:name]} has contacted you",
				body: "email: #{params[:email]}.
				Body: #{params[body]}"
				:via => :smtp,
			  	:via_options => {
			    	:address        => 'smtp.gmail.com',
			    	:port           => '587',
			    	:user_name      => 'user',
			    	:password       => 'password',
			   	 	:authentication => :plain, # :plain, :login, :cram_md5, no auth by default
			    	:domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
			  }
			})
"Thank you for contacting us"

end

get "/all" do 
	@contacts = Contact.all
	erb :all, layout: :default
end

get "/contacts/:id" do |id|
	@contacts = Contact.get id
end

















