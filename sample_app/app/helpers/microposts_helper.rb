module MicropostsHelper
	def microposts_helper_categories(input)
		if !input.nil?
			@categories = input.split(' ')
		end	
	end
end