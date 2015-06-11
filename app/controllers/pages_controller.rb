class PagesController < ApplicationController

	def home
		@user = User.find_by(id: 1)
		@albums = @user.albums
	end

	def about
	end

	def contact
	end
end
