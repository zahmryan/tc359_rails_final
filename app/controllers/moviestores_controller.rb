class MoviestoresController < ApplicationController
  before_action :only_allow_signed_in_users, except: [:index, :show]
  before_action :set_moviestore, only: [:show, :edit, :update, :destroy]

  # GET /moviestores
  # GET /moviestores.json
  def index
    @moviestores = Moviestore.all
  end

  # GET /moviestores/1
  # GET /moviestores/1.json
  def show
  end

  # GET /moviestores/new
  def new
    @moviestore = Moviestore.new
  end

  # Rentals from Moviestore page
  def rent
    @rentals = Rentals.create(rental_params)
  end

  # GET /moviestores/1/edit
  def edit
  end

  # POST /moviestores
  # POST /moviestores.json
  def create
    @moviestore = Moviestore.new(moviestore_params)

    respond_to do |format|
      if @moviestore.save
        format.html { redirect_to @moviestore, notice: 'Moviestore was successfully created.' }
        format.json { render :show, status: :created, location: @moviestore }
      else
        format.html { render :new }
        format.json { render json: @moviestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviestores/1
  # PATCH/PUT /moviestores/1.json
  def update
    respond_to do |format|
      if @moviestore.update(moviestore_params)
        format.html { redirect_to @moviestore, notice: 'Moviestore was successfully updated.' }
        format.json { render :show, status: :ok, location: @moviestore }
      else
        format.html { render :edit }
        format.json { render json: @moviestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviestores/1
  # DELETE /moviestores/1.json
  def destroy
    @moviestore.destroy
    respond_to do |format|
      format.html { redirect_to moviestores_url, notice: 'Moviestore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviestore
      @moviestore = Moviestore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moviestore_params
      params.require(:moviestore).permit(:title, :genre, :stock, :release_date, :currently_rented_out)
    end
end
