module ApplicationHelper
	def is_granted(*responsibles)
		if current_user.admin
			return true
		end

		responsibles.each do |res| 
			if Responsible.where(:name => res.to_s, :user_id => current_user.id).count > 0
				return true
			end
		end
		return false
	end
end
