class ReviewsController < ApplicationController
   def create
    @recette = Recette.find(params[:recette_id])
    @review = Review.new(review_params)
    authorize @recette
    authorize @review
    @review.recette = @recette
    @review.user = current_user
    if @review.save
      redirect_to recette_path(@recette, anchor: "review-#{@review.id}")
    else
      render "recettes/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :note)
  end
end
