class LoginsController < ApplicationController
	include LoginsHelper
	def new
			##flash[:message] = "You did it! Email sent to "
			@a = 4

	end

	def index
		@Logins = Login.all
	end

	def create
		if params[:commit] == 'A'
			params[:login][:short_op] = new_long_incoming(params[:login][:long])
			params[:commit] = ''
			@login = Login.find(params[:login][:id])
			render 'logins/show'
			return
		end
		if params[:commit] == 'B' 
			params[:login][:long_op] = find_long_url(params[:login][:short])
			params[:commit] = ''
			@login = Login.find(params[:login][:id])
			render 'logins/show'
			return
		end
		login_status = try_login(params[:login][:username],params[:login][:password])
		if login_status == "wrong username"
			#render new_login_path, notice: "its time"
  			redirect_to root_path
			return
		elsif login_status == "wrong password"
			redirect_to new_login_path, notice: "its"
			return
		elsif login_status == "logged in"
  			redirect_to login_path(:id => 5)
  			return
		else
			puts "something wrong"
		end

  		#@login = Login.new(login_params_log)
 
  		#@login.save
	end

	def show
		@u = Url.all
		@login = Login.find(params[:id])
	end

	
 
def convert
    if params[:commit] == 'A'
    	params[:login][:short] = 'auuu'
        puts "AAAAAAA"
    elsif params[:commit] == 'B'
        puts "BBBBBBB"
    end
end

private
  	def login_params_log
    	puts params.require(:login).permit(:username, :password)
  	end
  	def login_params_longshort
    	params.require(:login).permit(:long, :short, :id)
  	end
end
