class ReviewsController < ApplicationController

  get '/reviews' do
    if current_user
      @reviews = Review.all
      erb :'/reviews/index'
    end
  end
  
end