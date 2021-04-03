require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :home
  end

  helper do 
    def current_user
      # a ||= b, assigns b to a if a is falsey aka a = b unless a
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      #double !! to evaluate the above helper method as a boolean
      !!current_user
    end
  end

end
