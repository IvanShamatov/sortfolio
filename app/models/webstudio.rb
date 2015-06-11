class Webstudio < ActiveRecord::Base
	belongs_to :city
	has_one :user
	mount_uploader :img, AvatarUploader
end
