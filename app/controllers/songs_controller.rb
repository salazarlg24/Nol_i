class SongsController < ApplicationController
	before_action :require_login
	def index
		@user = User.find(session[:user_id])
		@songs = Song.all.order('created_at DESC')
	end

	def create
		song = Song.create(title: params[:title], artist: params[:artist], add: 0)
		if song.valid?
	  		redirect_to :back		  	
		else
			flash[:errors] = song.errors.full_messages 
			redirect_to :back
		end
	end

	def show
		@user = User.find(session[:user_id])
		@song = Song.find(params[:id])
		@list = List.where(song: @song)
	end


end
