module ApplicationHelper

	def avatar_profile_link(user)
		avatar_url = user.avatar? ? user.avatar.url(:thumb) : user.gravatar_url
		link_to (image_tag avatar_url), edit_user_registration_path
	end

	def flash_class_type(name)
		case name
		when 'notice'
			then "success"
		when 'alert'
			then "error"
		else
			""
		end
	end
end
