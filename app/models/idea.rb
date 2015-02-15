class Idea < ActiveRecord::Base
	acts_as_votable
	# Quora style community: no user 'owns' an idea
	has_many :users
end
