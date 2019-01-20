class LoginsController < ApplicationController
	def new

	end

	def index
		@Logins = Login.all
	end

	def create
		if params[:commit] == 'A' || params[:commit] == 'B'
			convert
			params[:commit] = ''
			render 'logins/show'
			return
		end
  		@login = Login.new(login_params_log)
 
  		@login.save
  		redirect_to @login
	end

	def show
		puts params
		@login = Login.find(params[:id])
		puts "nahiiii"
		puts @login[:id]
		puts @login[:username]
	end

	def try_login

	end
 
def convert
    if params[:commit] == 'A'
    	params[:short] = 'auuu'
        puts "AAAAAAA"
    elsif params[:commit] == 'B'
        puts "BBBBBBB"
    end
end

private
  	def login_params_log
    	params.require(:login).permit(:username, :password)
  	end
  	def login_params_longshort
    	params.require(:login).permit(:long, :short, :id)
  	end
end
