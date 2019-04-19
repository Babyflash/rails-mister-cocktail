class CocktailsController < ApplicationController
  # before_action :find_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    dose1 = @cocktail.doses.build
    dose1.build_ingredient

    dose2 = @cocktail.doses.build
    dose2.build_ingredient

    dose3 = @cocktail.doses.build
    dose3.build_ingredient
    #@cocktail.doses.build
   # @doses.ingredient.build
  end



  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save!

    redirect_to cocktails_path
  end

#  def edit
#    @cocktail = Cocktail.find(params[:id])
#  end

#  def update
#    @cocktail = Cocktail.find(params[:id])
#    @cocktail.update(cocktail_params)
#    redirect_to cocktail_path(@cocktail)
#  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end
# end

  def cocktail_params
    params.require(:cocktail).permit(:name, doses_attributes: [:name, :description, :ingredient_id])
  end
end
