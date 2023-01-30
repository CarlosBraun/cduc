class EvaluacionsController < ApplicationController
  before_action :set_evaluacion, only: %i[ show edit update destroy ]

  # GET /evaluacions or /evaluacions.json
  def index
    @evaluacions = Evaluacion.all
    if params[:view] == "edit"
      render 'index2'
    else
      render 'index1'
    end
  end

  # GET /evaluacions/1 or /evaluacions/1.json
  def show
  end

  def data
    @evaluacions = Evaluacion.all
  end

  # GET /evaluacions/new
  def new
    @evaluacion = Evaluacion.new
  end

  # GET /evaluacions/1/edit
  def edit
  end

  # POST /evaluacions or /evaluacions.json
  def create
    @evaluacion = Evaluacion.new(evaluacion_params)

    respond_to do |format|
      if @evaluacion.save
        format.html { redirect_to evaluacion_url(@evaluacion), notice: "Evaluacion was successfully created." }
        format.json { render :show, status: :created, location: @evaluacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluacions/1 or /evaluacions/1.json
  def update
    respond_to do |format|
      if @evaluacion.update(evaluacion_params)
        format.html { redirect_to evaluacion_url(@evaluacion), notice: "Evaluacion was successfully updated." }
        format.json { render :show, status: :ok, location: @evaluacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluacions/1 or /evaluacions/1.json
  def destroy
    @evaluacion.destroy

    respond_to do |format|
      format.html { redirect_to evaluacions_url, notice: "Evaluacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacion = Evaluacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluacion_params
      params.require(:evaluacion).permit(:title, :altura, :embergadura, :peso, :max_pres, :max_squat , :max_dl , :max_jump_incompleto , :max_jump_completo , :max_jump_libre , :max_jump_carrera , :max_v1 , :max_v2 , :max_time, :jugador_id)
    end
end
