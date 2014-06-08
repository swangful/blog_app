class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.where({email: params[:session][:email]}).first

		if user
			session[:user] = user.id
		else
			redirect_to signup_path, :flash => { :error => "Please sign up to continue." }
		end
	end

	def destroy
		session[:user] = nil
    	redirect_to root_path
	end
end


    