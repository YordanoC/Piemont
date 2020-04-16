class ReviewsController < ApplicationController
   def create
    @recette = Recette.find(params[:recette_id])
    @review = Review.new(review_params)
    authorize @recette
    authorize @review
    @review.recette = @recette
    @review.user_id = current_user.id
    if @review.save
      redirect_to recette_path(@recette, anchor: "review-#{@review.id}")
    else
      render template: "recettes/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :note)
  end
end
