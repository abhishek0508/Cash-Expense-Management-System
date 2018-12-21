class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :require_login
    def require_login
        unless logged_in?
            flash[:error] = "you must be logged in to access this section"
            redirect_to  login_path
        end
    end
    def logged_in?
        if current_user == nil
            return false
        else
            return true
        end
    end
end
