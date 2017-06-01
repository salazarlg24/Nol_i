class UsersController < ApplicationController
	before_action :require_login, except: [:index,:login, :register]
	def index
	end

	def show
		@user = User.find(params[:id])
		@list = List.where(user: @user)
	end

	def login
	@user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
		if (@user)
			session[:user_id] = @user.id
			redirect_to "/songs"

		else
		flash[:error] = "User information not found." 
		redirect_to :back	
		end
	end

	def register
		@user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	  	if @user.valid?
	  		session[:user_id] = @user.id
	  		puts 'User created'
	  		redirect_to "/songs"		  	
		else
			flash[:errors] = @user.errors.full_messages 
			redirect_to :back
		end
	end

	def logout
		session.clear
	redirect_to '/'
	end
end
