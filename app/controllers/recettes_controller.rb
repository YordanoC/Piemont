class RecettesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_recette, only: %i[show edit update destroy]
  before_action :set_counter
  def index
    @recettes = policy_scope(Recette)
    authorize @recettes
     respond_to do |format|
      format.html
      format.json { render json: { recettes: @recettes } }
    end
  end

  def show
    @recettes = Recette.all
    @review = Review.new
    authorize @recettes
    authorize @recette
    respond_to do |format|
      format.html
      format.json { render json: { reviews: @recette.reviews } }
    end
  end

  def new
    @recette = Recette.new
    authorize @recette
  end

  def create
    @recette = Recette.new(recette_params)
    authorize @recette
    if @recette.save
      redirect_to recettes_path
    else
      render :new
    end
  end

  def edit
    authorize @recette
  end

  def update
    authorize @recette
    if @recette.update(recette_params)
      redirect_to recette_path(@recette)
    else
      render :edit
    end
  end

  def destroy
    authorize @recette
    @recette.destroy
    redirect_to recettes_path
  end

private

  def set_counter
    @recette_count = Recette.count
  end

  def set_recette
    @recette = Recette.find(params[:id])
  end
  def recette_params
    params.require(:recette).permit(:title, :contenu, :intro, :redirection, :redirection,:photo, :photo_2, :categorie)
  end
end
