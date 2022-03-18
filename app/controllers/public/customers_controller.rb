class Public::CustomersController < ApplicationController
  
  before_action :configure_permitted_parameters, if: :public_controller?
  
  def show
    @customers = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end



  def configure_permitted_parameters
    public_paramerer_sanitizer.perit(:sign_up, keys: [:name])

end
