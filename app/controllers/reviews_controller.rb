class ReviewsController < ApplicationController

  get '/reviews' do
    if current_user
      @reviews = Review.all
      erb :'/reviews/index'
    end
  end

  get '/reviews/:id' do
    id = params[:id].to_i
    @review = Review.find_by_id(id)
    erb :'/reviews/show'
  end
  
end