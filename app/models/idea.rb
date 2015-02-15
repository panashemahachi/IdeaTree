class Idea < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable
	acts_as_followable
	# Quora style community: no user 'owns' an idea
	belongs_to :user
	has_many :comments
end
