class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @restaurants = Restaurant.all
  end

  def new 
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to root_path, notice: 'Restaurante criado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível criar o restaurante.'
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:brand_name, :corporate_name, :cnpj, :address, :phone, :email, :monday_opening, :monday_closing, :tuesday_opening, :tuesday_closing, :wednesday_opening, :wednesday_closing, :thursday_opening, :thursday_closing, :friday_opening, :friday_closing, :saturday_opening, :saturday_closing, :sunday_opening, :sunday_closing)
  end
end