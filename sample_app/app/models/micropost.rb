class Micropost < ActiveRecord::Base
	attr_accessible :content
	belongs_to :user 
	#validates :contet , :presence => true, :length => {:maximum => 380 }
	#validates :user_id , :presence => true
	#default_scope :order => 'microposts.create_at DESC'

end
