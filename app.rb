# encoding: UTF-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'

configure do 
	@db = SQLite3::Database.new 'barb_shop.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS
		"Users"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"datestamp" TEXT,
			"barber" TEXT,
			"color" TEXT
		)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	#@error = 'Something wrong!'
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

  @user_name = params[:username]
  @phone = params[:phone]
  @date_time = params[:datetime]
  @barber = params[:barber]
  @color = params[:hair_color]

  #user_unput = [ @user_name, @phone, @date_time ]
 
  # хеш
 	hh = { :username => 'Ошибка, введите имя', 
 				:phone => 'Ошибка, Вы не ввели телефон', 
 				:datetime => 'Ошибка, введите дату и время'
 	}


 	hh.each do |key, value|

 		# если параметр пуст
 		if params[key] == ''
 			# переменной error присвоить значение value из хеша hh
 			# (а value из хеша hh - это сообщение об ошибке)
 			# т.е переменной error присвоить сообщение об ошибке
 			@error = hh[key]

 			# вернуть представление :visit
 			return erb :visit
 		end

 	end

	#user_unput.each do |item|
  #	if item == ''
	 	#erb :visit
	#  	@error = 'Ошибка. Возможно Вы заполнили не все поля...'
	#  	return erb :visit
	#	end
  #end
  
  #file = File.open './public/users.txt','a'
  #file.write "User: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}, Barber: #{@barber}\n\r"
  #file.close
  
  erb "OK! username is #{@user_name}, your phone: #{@phone}, date and time: #{@date_time}, barber: #{@barber}, color: #{@color}"
  
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@user_email = params[:email]
	@usermessage = params[:user_message]

	if @user_email == ''
		@error = 'Вы не ввели email'
		erb :contacts
	end

	if @usermessage == ''
		@error = 'Вы не ввели сообщение'
		erb :contacts
	end

	#if @user_email == ''
	#	@error = 'Вы не ввели email'
	#	erb :contacts
	#elsif @user_message == ''
	#	@error = 'Вы не ввели сообщение'
	#	erb :contacts
	#else 
	#	erb :contacts
	#end

	#file = File.open './public/contacts.txt','a'
	#file.write "Email : #{@user_email},\n\r Message: #{@user_message}\n\r"
	#file.close

	#erb :contacts
	
end
