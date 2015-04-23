class RentalsController < ApplicationController
  before_action :only_allow_signed_in_users
  def rent
    @rentals = Rentals.create(rental_params)
  end
end