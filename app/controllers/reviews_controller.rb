class ReviewsController < ApplicationController

  #main page for the app, displays all of the movie reviews
  get '/reviews' do
    if is_logged_in?
      @reviews = Review.all
      erb :'/reviews/index'
    else
      redirect "/"
    end
  end

  #new page to add another movie review
  get '/reviews/new' do
    if is_logged_in?
      @current_year = Time.now.year
      erb :'/reviews/new'
    else
      redirect "/"
    end
  end

  #show page for an individual movie review
  get '/reviews/:id' do
    if is_logged_in?
      @review = Review.find_by_id(params[:id])
      erb :'/reviews/show'
    else
      redirect "/"
    end
  end
  
  #post for adding a new movie review
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

  #get the edit page that is prepopulated with the existing data
  get "/reviews/:id/edit" do
    if is_logged_in?
      @review = Review.find_by_id(params[:id])
      @current_year = Time.now.year
      if @review
        erb :'/reviews/edit'
      else
        redirect "/reviews/:id"
      end
    else
      redirect "/"
    end
  end

  #patch to update a review
  patch "/reviews/:id" do
    @review = Review.find_by_id(params[:id])
    if @review && @review.update(title: params[:title], year: params[:year], rating: params[:rating], content: params[:content])
      redirect "/reviews/#{@review.id}"
    else
      redirect "/reviews/#{params[:id]}/edit"
    end
  end

  #delete route to remove a review from the database
  delete '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    if @review
      @review.delete
    end
    redirect "/reviews"
  end

end