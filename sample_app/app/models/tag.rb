class Tag < ActiveRecord::Base
	attr_accessable :name
	
	#has_many :link_tag
	#has_many :micropost, :through => :link_tag
	has_and_belongs_to :microposts
end
