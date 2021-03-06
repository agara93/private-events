module SessionsHelper
    def signin(user)
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        user.update_attribute(:remember_token, User.digest(remember_token))
        self.current_user = user
    end
    
    def current_user=(user)
        @current_user = user
    end
    
    def current_user
        remember_token = User.digest(cookies[:remember_token])
        @current_user ||= User.find_by(remember_token: remember_token)
    end
    
    def signed_in?
        !current_user.nil?
    end
    
    def signout
        current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
        cookies.delete(:remember_token)
        self.current_user = nil
    end
    
    def current_user?(user)
        user == current_user
    end
    
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end
