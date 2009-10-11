class Meeting < ActiveRecord::Base
	has_many :meeting_users
  	has_many :users, :through => :meeting_users
	attr_accessor :user_ids
  	after_save :update_users

	def test1
logger.info self.meeting_users.size
logger.info Meeting.last.meeting_users.size
logger.info('pp')
	end

 	#after_save callback to handle group_ids
	def update_users
		 unless user_ids.blank?
		      self.meeting_users.each do |p|
		       p.destroy unless (user_ids.include?(p.user_id.to_s))
        	       user_ids.delete(p.user_id.to_s) 
      		      end
      		user_ids.each do |c|
        	self.meeting_users.create(:user_id => c) unless c.blank?
      		end
      		reload
		end
	end

end
