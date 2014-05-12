class Micropost < ActiveRecord::Base
	attr_accessible :content ,:tag
	belongs_to :user 

	#has_many :link_tag
	#has_many :tag , :through => :link_tag
	#has_and_belongs_to_many :tags

	validates :content , :presence => true, :length => {:maximum => 380 }
	validates :user_id , :presence => true
	default_scope :order => 'microposts.created_at DESC'
  
end
