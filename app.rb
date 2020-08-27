require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/'  do
    erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a>"
  
end

get '/about' do
	@error='something wrong'
    erb :about
end


get '/visit' do
    erb :visit
end

post '/visit' do
    
    @username=params[:username]
    @phone=params[:phone]
    @datetime=params[:datetime]
    @barber=params[:barber]
    @color=params[:color]


    hh = { :username => 'Введите имя',
    	   :phone => 'Введите телефон',
    	   :datetime => 'Введите дату и время'}

    hh.each do |key, value|
    	if params[key] == ''
    		@error = hh[key]
    		return erb :visit
    	end
    end

    erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end

