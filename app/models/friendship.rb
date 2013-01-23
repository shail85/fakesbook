class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :status, :friend, :user, :fullname, :username
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
#validates :user_id,  :presence => true
#validates :friend_id,  :presence => true

  def self.are_friends(user, friend)
    return false if user == friend
    return true unless find_by_user_id_and_friend_id(user, friend).nil?
    return true unless find_by_user_id_and_friend_id(friend, user).nil?
    false
  end


 def self.request(user, friend)
	if user == friend
	redirect_to(:controller => :users, :action => :index)
	else
	f1 = new(:user_id => user, :friend_id => friend, :status => "pending")
	f2 = new(:user_id => friend, :friend_id => user, :status => "requested")
	transaction do
		f1.save
		f2.save
	end
	return true
	end
 end

end
