require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = 1 + rand(99)
guess_count = 5

get '/' do
  unless params["guess"].nil?
  	guess_count -= 1
  	"You have #{guess_count} tries left."
  end
  if guess_count == 0
  	 "You LOOSE!"
  	 SECRET_NUMBER = 1 + rand(99)
	 guess_count = 5
  	
  end


  puts guess_count
  message = check_guess(params["guess"])
  color = style message
  erb :index, :locals => {:message => message, :color => color}
end

def check_guess(guess)
	if guess.nil?

	else
		if guess.to_i > SECRET_NUMBER + 5 
	  		return "Way Too High"
	    elsif guess.to_i < SECRET_NUMBER - 5 
	  		return "Way Too Low"
	 	elsif guess.to_i > SECRET_NUMBER 
	  		return "Number is too High." 
	  	elsif guess.to_i < SECRET_NUMBER 
	  		return " Number is too Low."
	    elsif  guess.to_i == SECRET_NUMBER 
	  		return "YOUR GUESS IS CORRECT!"
	  	end 
	end
end

def style(message)
	case message
		when "Way Too High" then "red" 
		when "Way Too Low"  then "red"
		when "Number is too High" then "red"
		when "Number is too Low." then "red"
		when "Number is too Low." then "red"
		when "YOUR GUESS IS CORRECT!" then "green"
	end
end








