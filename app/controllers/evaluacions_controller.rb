class EvaluacionsController < ApplicationController
  before_action :set_evaluacion, only: %i[ show edit update destroy ]

  # GET /incidents or /incidents.json
  def index
    @evaluacions = Evaluacion.all
  end

  # GET /incidents/1 or /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @evaluacion = Evaluacion.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents or /incidents.json
  def create
    @evaluacion = Evaluacion.new(evaluacion_params)

    respond_to do |format|
      if @evaluacion.save
        format.html { redirect_to evaluacion_url(@evaluacion), notice: "Evaluacion guardada de forma correcta." }
        format.json { render :show, status: :created, location: @evaluacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1 or /incidents/1.json
  def update
    respond_to do |format|
      if @evaluacion.update(evaluacion_params)
        format.html { redirect_to ticket_url(Ticket.last), notice: "Evaluacion actualizada de forma correcta." }
        format.json { render :show, status: :ok, location: @evaluacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1 or /incidents/1.json
  def destroy
    @evaluacion.destroy

    respond_to do |format|
      format.html { redirect_to evaluacions_url, notice: "Evaluación eliminada de forma exitosa." }
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
      params.fetch(:evaluacion, {}).permit(:id, :summary, :description, :creation_date, :comment_id)
    end
end
