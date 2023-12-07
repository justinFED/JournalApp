module AuthenticationHelper
    def authenticate_user(username, password)
        user = User.find_by(username: username)
      
        if user && user.authenticate(password)
          return user
        else
          return nil
        end
    end
end
  