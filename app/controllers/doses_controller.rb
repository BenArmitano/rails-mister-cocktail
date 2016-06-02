class DosesController < ApplicationController
before_action :find_dose, only: [:new, :create]

  def new
     @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  # def create
  #   # il faut créer une dose consolidée avec les données cocktails
  #   @dose = @cocktail.doses.build(dose_params)
  #   respond_to do |format|
  #     if @dose.save
  #       format.html { redirect_to @cocktail, notice: 'Dose was successfully created.' }
  #       format.json { render :show, status: :created, location: @cocktail }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cocktail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def destroy
      @dose = Dose.find(params[:id])
      @dose.destroy
      redirect_to cocktail_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def find_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
