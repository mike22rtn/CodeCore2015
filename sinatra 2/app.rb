require "sinatra"
require "pony"

#get -> HTTP verb
#"/" -> URL
get "/" do
	erb :index, layout: :default 
end

	get "/hi" do 
		"Hi there"
end

	get "/contact" do
		erb :contact, layout: :default 
end

	post "/contact" do
		pony.mail(to: m.renton22@gmail.com,
					from: params[:email],
					reply_to: params[:email],
					subject: "#{params[:name] contacted}"
					via: :smtp,
					via_options: {
						address: "smtp.gmail.com",
						port: "587",
						user_name: "answerawesome",
						password: "super3secret",
						authentication: plain,
						enable_starttls_auto: true
						}
		params.to_s
end

	post "/contact" do
		"Thanks for submitting"
	end

#Notes
#HTTP
#verb: get post put patch delete

#URL: /hello /post /post/id

#params: {} 