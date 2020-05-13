class SessionsController < ApplicationController

def new
end

def create
user = User.find_by(email: params[:session][:email].downcase) #taking params from users ui
	if user && user.authenticate(params[:session][:password]) #authenticating that user already exists
		session[:user_id] = user.id #for browser hash -- basically saving user id in your sessions hash for browser cookies that id is already in session
		flash[:success] = "You have successfully logged in"
		redirect_to user_path(user)
	else
	    flash.now[:danger] = "there is something wrong with your login information"	
	   render 'new'
	end

end

def destroy
	session[:user_id] = nil
	flash[:success] = "you have logged out"
	redirect_to root_path
end


end