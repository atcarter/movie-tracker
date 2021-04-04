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
    @current_year = Time.now.year
    erb :'/reviews/new'
  end

  get '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    erb :'/reviews/show'
  end

  post '/reviews' do
    if is_logged_in?
      @review = Review.new(title: params[:title], year: params[:year], rating: params[:rating], content: params[:content], user: current_user)
      if @review.save
        redirect "/reviews/#{@review.id}"
      else
        redirect "/reviews/new"
      end
    else
      redirect "/"
    end
  end

  get "/reviews/:id/edit" do
    @review = Review.find_by_id(params[:id])
    @current_year = Time.now.year
    if @review
      erb :'/reviews/edit'
    else
      redirect "/reviews/:id"
    end
  end

  patch "/reviews/:id" do
    @review = Review.find_by_id(params[:id])
    if @review && @review.update(title: params[:title], year: params[:year], rating: params[:rating], content: params[:content])
      redirect "/reviews/#{@review.id}"
    else
      redirect "/reviews/#{params[:id]}/edit"
    end
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    if @review
      @review.delete
    end
    redirect "/reviews"
  end

end