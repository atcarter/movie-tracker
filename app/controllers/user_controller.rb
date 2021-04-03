
get '/signup' do
  
  erb :'/users/signup'
end

post '/signup' do
  if params[:email] && params[:username] && params[:password] == params[:conf_password]
    @user = User.new(email: params[:email], username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = @user.id
      redirect '/reviews'
    end
  else
    redirect '/signup'
  end
end

get 'login' do
  
end