class WelcomeController < ApplicationController
	before_action do
		check_user_and_redirect(current_user)
	end
	def index
	end
end
