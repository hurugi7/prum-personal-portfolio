class ApplicationController < ActionController::Base

    def hello
			render html: "hello wordl!"
		end
end
