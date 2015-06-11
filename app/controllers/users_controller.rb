class UsersController < ApplicationController
 
  def show
  	@user = User.find(params[:id])
  	@albums = @user.albums
  	@album = current_user.albums.build if logged_in?
  end
end
