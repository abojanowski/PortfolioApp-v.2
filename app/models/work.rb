class Work < ActiveRecord::Base
  belongs_to :album
  mount_uploader 				:picture, PictureUploader
  validates		:picture, presence: true
end	