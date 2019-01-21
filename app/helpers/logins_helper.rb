module LoginsHelper

	def try_login(username , password)
		if Login.find_by(username: username) == nil
			puts "error"
		elsif Login.find_by(username: username).password != password
			puts "not matched"
		else
			puts "matched : log in allowed"
		end
	end

	def new_long_incoming(long_url)
		if Url.find_by(long: long_url) == nil
			 @urls = Url.new({:long => long_url, :short => convert_to_short})
			 @urls.save
			 puts "hey"
			 return Url.find_by(long: long_url).short
		else
			return Url.find_by(long: long_url).short
			#render json: {"h" : "hello"}
		end
	end
	def convert_to_short
		number = 7
		charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
  		return Array.new(number) { charset.sample }.join

	end

	def find_long_url(short_url)
		if Url.find_by(short: short_url) == nil
			puts "no such short url"
		else
			return Url.find_by(short: short_url).long
		end
	end

	private
  		def url_params_log
    		params.require(:login).permit(:long, :short)
  		end
  	end

