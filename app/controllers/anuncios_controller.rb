class AnunciosController < ApplicationController
  before_action :set_anuncio, only: %i[ show edit update destroy ]

  # GET /anuncios or /anuncios.json
  def index
    @anuncios = Anuncio.all
  end

  # GET /anuncios/1 or /anuncios/1.json
  def show
  end

  # GET /anuncios/new
  def new
    @anuncio = Anuncio.new
  end

  # GET /anuncios/1/edit
  def edit
  end

  # POST /anuncios or /anuncios.json
  def create
    @anuncio = Anuncio.new(anuncio_params)

    respond_to do |format|
      if @anuncio.save
        format.html { redirect_to anuncio_url(@anuncio), notice: "Anuncio was successfully created." }
        format.json { render :show, status: :created, location: @anuncio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anuncios/1 or /anuncios/1.json
  def update
    respond_to do |format|
      if @anuncio.update(anuncio_params)
        format.html { redirect_to anuncio_url(@anuncio), notice: "Anuncio was successfully updated." }
        format.json { render :show, status: :ok, location: @anuncio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anuncios/1 or /anuncios/1.json
  def destroy
    @anuncio.destroy

    respond_to do |format|
      format.html { redirect_to anuncios_url, notice: "Anuncio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anuncio
      @anuncio = Anuncio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anuncio_params
      params.require(:anuncio).permit(:title, :description, :categoria, :remitente)
    end
end
