class Hobby < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  validates :name, :description, :presence => true
  belongs_to :user
end
