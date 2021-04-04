require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "secret"
  end

  #Create a home page where the user can sign up or log in
  get "/" do
    erb :home
  end

  #helper methods to set the current user and verify if a user is logged in
  helpers do 
    def current_user
      # a ||= b, assigns b to a if a is falsey aka a = b unless a
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def is_logged_in?
      #double !! to evaluate the above helper method as a boolean
      !!current_user
    end
  end

end
