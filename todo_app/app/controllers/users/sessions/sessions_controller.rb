# frozen_string_literal: true

class Users::Sessions::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  class Users::SessionsController < Devise::SessionsController
    def create
      # Call the default behavior from Devise::SessionsController
      super do |user|
        # This block is executed when the user signs in successfully
        flash[:success] = "Welcome back, #{user.email}!"
        redirect_to root_path
      end
  
      # This block is executed when the user fails to sign in
      flash[:error] = "Invalid email or password"
      render :new
    end
  end
  
end
