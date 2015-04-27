class RentalsController < ApplicationController
  before_action :only_allow_signed_in_users

  def create
    if defined? params[:movie_id]
      @movie_id = params[:movie_id]
    else
      respond_to do |format|
        format.html { redirect_to moviestores_url }
        format.json { head :no_content }
      end
    end
    @rentals = Rentals.new
    @rentals.user_id = current_user.id if current_user
    @rentals.movie_id = @movie_id

    respond_to do |format|
      if @rentals.save
        format.html { redirect_to moviestores_path, notice: 'Rental was successfully added.' }
        format.json { render action: 'show', status: :created, location: @moviestore }
      else
        format.html { render action: 'new' }
        format.json { render json: moviestores_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end
end