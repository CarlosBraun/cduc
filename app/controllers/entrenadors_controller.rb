class EntrenadorsController < ApplicationController
  before_action :set_entrenador, only: %i[ show edit update destroy ]

  # GET /supervisors or /supervisors.json
  def index
    @entrenadors = Entrenador.all
  end

  # GET /supervisors/1 or /supervisors/1.json
  def show
  end

  # GET /supervisors/new
  def new
    @entrenador = Entrenador.new
  end

  # GET /supervisors/1/edit
  def edit
  end

  # POST /supervisors or /supervisors.json
  def create
    @entrenador = Entrenador.new(entrenador_params)

    respond_to do |format|
      if @entrenador.save
        format.html { redirect_to entrenador_url(@entrenador), notice: "Entrenador guardado de forma correcta." }
        format.json { render :show, status: :created, location: @entrenador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrenador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supervisors/1 or /supervisors/1.json
  def update
    respond_to do |format|
      if @entrenador.update(entrenador_params)
        format.html { redirect_to entrenador_url(@entrenador), notice: "Entrenador actualizado de forma correcta." }
        format.json { render :show, status: :ok, location: @entrenador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrenador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisors/1 or /supervisors/1.json
  def destroy
    @entrenador.destroy

    respond_to do |format|
      format.html { redirect_to entrenadors_url, notice: "Entrenador eliminado de forma correcta." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrenador
      @entrenador = Entrenador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrenador_params
      params.fetch(:entrenador, {})
    end
end
