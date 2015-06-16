class WorksController < ApplicationController
before_action :correct_work,   only: :destroy

	def create
		@album = Album.find(params[:album_id])
		# debugger
		@work = @album.works.build(works_params)
		if @work.save
			# debugger
			flash[:success] = "Image Uploaded!"
			redirect_to album_path(@album)
		else
			flash[:warning] = "Add Image!"
			redirect_to album_path(@album)
		end
	end	

		def destroy
			# debugger
			@work.destroy
			redirect_to album_path(@work.album_id)
		end

	private

		def works_params
			params.fetch(:work, {}).permit(:picture)
		end

		def correct_work
			@work = Work.find_by(id: params[:id])
  	end 

end

