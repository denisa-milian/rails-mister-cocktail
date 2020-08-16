class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update]

  def home
  end

  def index
    if params[:query].present?

      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")


      # sql_query = " \
      #   doses.cocktails.name ILIKE :query \
      #   OR doses.ingredients.name ILIKE :query \
      # "
      # @cocktails = Dose.joins(:ingredient).where(sql_query, query: "%#{params[:query]}%")

    else
      @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
