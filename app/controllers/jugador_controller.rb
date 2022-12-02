class JugadorsController < ApplicationController
  before_action :set_jugador, only: %i[ show edit update destroy ]

  # GET /support_executives or /support_executives.json
  def index
    @jugadors = Jugador.all
  end

  # GET /support_executives/1 or /support_executives/1.json
  def show
  end

  # GET /support_executives/new
  def new
    @jugador = Jugador.new
  end

  # GET /support_executives/1/edit
  def edit
  end

  # POST /support_executives or /support_executives.json
  def create
    @jugador = Jugador.new(jugador_params)

    respond_to do |format|
      if @jugador.save
        format.html { redirect_to jugador_url(@jugador), notice: "Jugador guardado de forma correcta." }
        format.json { render :show, status: :created, location: @jugador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_executives/1 or /support_executives/1.json
  def update
    respond_to do |format|
      if @jugador.update(jugador_params)
        format.html { redirect_to jugador_url(@jugador), notice: "Jugador actualizado de forma correcta." }
        format.json { render :show, status: :ok, location: @jugador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_executives/1 or /support_executives/1.json
  def destroy
    @jugador.destroy

    respond_to do |format|
      format.html { redirect_to jugadors_url, notice: "Jugador eliminado de forma correcta." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jugador
      @jugador = Jugador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jugador_params
      params.fetch(:jugador, {})
    end
end
