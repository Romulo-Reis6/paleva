# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super 
  # end

  # POST /resource/sign_in
  def create
    super do
      puts "entrou no create login"
      restaurant = Restaurant.find_by(user_id: current_user.id)
      if restaurant.nil?
        redirect_to new_restaurant_path
        return
      else
        redirect_to root_path
        return
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
