def check_user_and_redirect(user)
	if !user
		redirect_to '/users/sign_in'
	end
	return false
end