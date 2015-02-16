class Idea < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable
	acts_as_followable
	# Quora style community: no user 'owns' an idea
	belongs_to :user
	has_many :comments
	has_many :branches

	scope :most_branched_off,
	    select("idea.id, count(branches.id) AS branches_count").
	    joins(:branches).
	    group("ideas.id").
	    order("branches_count DESC")

def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("description like ? OR title like ?", "%#{query}%", "%#{query}%")
  end
end
