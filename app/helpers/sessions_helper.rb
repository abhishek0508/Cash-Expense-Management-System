module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
        
    end
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
            !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def authenticate_user
        # var = params[:user_id].to_i
        if session[:user_id] != params[:user_id].to_i
            redirect_to unauthorize_path
        end
    end

    def already_login
        if logged_in?
            redirect_to login_path
        end
    end

end
