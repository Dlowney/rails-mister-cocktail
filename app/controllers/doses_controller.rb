class DosesController < ApplicationController
  def show
    @dose = Dose.find(params[:id])
  end

  def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new
   @ingredients = Ingredient.all
 end

 def create
   @dose = Dose.new(dose_params)
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose.cocktail = @cocktail
   @ingredients = Ingredient.all
   if @dose.save
     redirect_to cocktail_path(id: @cocktail.id)
   else
     render :new
   end
 end

 def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)
    redirect_to cocktails_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
