class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.where({email: params[:session][:email]}).first

		if user
			session[:current_user_id] = user.id
			redirect_to posts_path, :flash => { :error => "You have successfully logged in."}
		else
			redirect_to signup_path, :flash => { :error => "Please sign up to continue." }
		end
	end

	def destroy
		session[:current_user_id] = nil
		
    	redirect_to root_path, :flash => { :error => "You have been successfully logged out."}
	end
end


    