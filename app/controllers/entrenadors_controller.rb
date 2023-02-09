class EntrenadorsController < ApplicationController
  before_action :set_entrenador, only: %i[ show edit update destroy ]

  # GET /entrenadors or /entrenadors.json
  def index
    @entrenadors = Entrenador.all
  end

  # GET /entrenadors/1 or /entrenadors/1.json
  def show
  end

  # GET /entrenadors/new
  def new
    @entrenador = Entrenador.new
  end

  # GET /entrenadors/1/edit
  def edit
  end

  # POST /entrenadors or /entrenadors.json
  def create
    params[:entrenador][:fullname] = params[:entrenador][:name] +" "+params[:entrenador][:last_name]
    @entrenador = Entrenador.new(entrenador_params)
    respond_to do |format|
      if @entrenador.save
        format.html { redirect_to entrenador_url(@entrenador), notice: "Entrenador was successfully created." }
        format.json { render :show, status: :created, location: @entrenador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrenador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrenadors/1 or /entrenadors/1.json
  def update
    respond_to do |format|
      params[:entrenador][:fullname] = params[:entrenador][:name] +" "+params[:entrenador][:last_name]
      if @entrenador.update(entrenador_params)
        format.html { redirect_to entrenador_url(@entrenador), notice: "Entrenador was successfully updated." }
        format.json { render :show, status: :ok, location: @entrenador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrenador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrenadors/1 or /entrenadors/1.json
  def destroy
    @entrenador.destroy

    respond_to do |format|
      format.html { redirect_to entrenadors_url, notice: "Entrenador was successfully destroyed." }
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
      params.fetch(:entrenador, {}).permit(:id, :name, :last_name, :mail, :telephone, :fullname,  :rol, :avatar)
    end
end
