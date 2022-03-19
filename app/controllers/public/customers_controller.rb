class Public::CustomersController < ApplicationController



  def show
    @customers = current_customer
  end

  def edit
    @customers = current_customer
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  
  def customers_params
  end





end
