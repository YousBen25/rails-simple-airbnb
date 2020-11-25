class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  def index
    @number_flat = Flat.count
    if params[:query]
      @flats = Flat.where("name like ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def create
    @flat = Flat.create!(flat_params)
    redirect_to root_path
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to "/"
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end

