require 'sinatra'
require 'sinatra/reloader'

number = (1 + rand(99)).to_s

get "/" do
	 params["guess"]
	 erb :index, :locals => {:number => number}
end

def check_guess(guess)
	if guess.to_i == number.to_i + 40
		puts "TOO HIGH!"
	elsif guess.to_i == number.to_i - 40
		puts "TOO LOW"
	end
end


