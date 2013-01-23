class User < ActiveRecord::Base

attr_accessible :username, :forename, :surname, :occupation, :town, :email, :password, :password_confirmation, :persistence_token

acts_as_authentic

validates :password, :confirmation => true
validates :password_confirmation, :presence => true
validates :forename, :presence => true
validates :surname, :presence => true
validates :town, :presence => true

has_many :hobby
has_many :friendship

#acts_as_authentic do |c|
#c.require_password_confirmation = false
end
#end
