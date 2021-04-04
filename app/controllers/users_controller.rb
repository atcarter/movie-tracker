class UsersController < ApplicationController
  get '/signup' do
    
    erb :'/users/signup'
  end

  # old version
  # post '/signup' do
  #   if params[:email] && params[:username] && params[:password] == params[:password_confirmation]
  #     @user = User.new(email: params[:email], username: params[:username], password: params[:password])
  #     if @user.save
  #       session[:user_id] = @user.id
  #       redirect '/reviews'
  #     end
  #   else
  #     redirect '/signup'
  #   end
  # end

  #bcrypt version
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