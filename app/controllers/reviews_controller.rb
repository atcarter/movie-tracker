class ReviewsController < ApplicationController

  get '/reviews' do
    if current_user
      @reviews = Review.all
      erb :'/reviews/index'
    else
      redirect "/"
    end
  end

  get '/reviews/new' do
    @t = Time.now
    erb :'/reviews/new'
  end

  get '/reviews/:id' do
    id = params[:id].to_i
    @review = Review.find_by_id(id)
    erb :'/reviews/show'
  end

  post '/reviews' do
    if is_logged_in?
      @review = Review.create(title: params[:title], year: params[:year], rating: params[:rating], content: params[:content], user: current_user)
      redirect "/reviews/#{@review.id}"
    else
      redirect "/"
    end
  end
  
end