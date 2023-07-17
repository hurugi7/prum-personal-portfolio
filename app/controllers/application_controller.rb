class ApplicationController < ActionController::Base
	include SessionsHelper

	private

		def logged_in_user
			unless logged_in?
				flash[:danger] = "ログインしてください"
				redirect_to login_url, status: :see_other
			end
		end


    def redirect_if_logged_in
      if current_user
        redirect_to user_path(current_user)
      end
    end
end
