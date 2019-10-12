class Api::ReviewsController < ApplicationController

    def index
        render json: Review.all
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: review
        else
            render json: { errors: review.errors }, status: :unprocessable_entity
        end
    end

    def update
        review = Review.find(params[:id])
        review.update(complete: !item.complete)
        render json: review
    end

    def destroy
        Review.find(params{:id}).destroy
        render json: { message: 'Review Deleted' }
    end

    private

    def review_params
        params.require(:review).permit(:name, :body)
    end
end
