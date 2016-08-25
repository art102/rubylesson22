require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

  @user_name = params[:username]
  @phone = params[:phone]
  @date_time = params[:datetime]

  #@title = 'Thanks!'
  #@message = "Thank you, #{@user_name}, we'll be waiting at #{@date_time}"
  
  file = File.open './public/users.txt','a'
  file.write "User: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}\n\r"
  file.close
  erb :visit
  #erb :message

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@user_email = params[:email]
	@user_message = params[:user_message]

	file = File.open './public/contacts.txt','a'
	file.write "Email : #{@user_email},\n\r Message: #{@user_message}\n\r"
	file.close

	erb :contacts
	
end
