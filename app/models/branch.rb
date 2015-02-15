class Branch < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  has_many :comments
end
