class ListsController < ApplicationController
	before_action :require_login
	def create
		song = Song.find(params[:id]).increment!(:add)
		user = User.find(session[:user_id])
		user_added = List.find_by(user: user,song:params[:id])
		if(user_added)
			user_added.increment!(:adds)
		else
			List.create(user: user, song: song, adds: 1)
		end
		
		redirect_to :back
	end


end
