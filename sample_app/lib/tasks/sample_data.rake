require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke 
		admin = User.create!(	:name => "Sinan NAR",
						:email => "sinan.nar@gmail.com",
						:password => "123456",
						:password_confirmation => "123456")
		admin.toggle!(:admin)
		Micropost.create(:content=>"hi",
		   				  :user_id=>1)
		99.times do |n|
			name = Faker::Name.name
		    email = "example-#{n+1}@user.com"
		    password = "password"
		    User.create!( :name => name,
		                  :email => email,
		                  :password => password,
		                  :password_confirmation => password)
		end
		User.all(:limit => 6).each do |user|
			50.times do
				user.microposts.create!(:content=> Faker::Lorem.sentence(5))			
			end
		end
	end
end