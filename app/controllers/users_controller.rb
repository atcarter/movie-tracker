class UsersController < ApplicationController
  get '/signup' do    
    erb :'/users/signup'
  end

  #utilize bcrypt in new statement
  post '/signup' do
    @user = User.new(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/reviews'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/reviews'
    else
      redirect '/login'
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
end