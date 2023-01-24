class HorariosController < ApplicationController
  before_action :set_horario, only: %i[ show edit update destroy ]

  # GET /horarios or /horarios.json
  def index
    @horarios = Horario.all
  end

  # GET /horarios/1 or /horarios/1.json
  def show
  end

  # GET /horarios/new
  def new
    @horario = Horario.new
  end

  # GET /horarios/1/edit
  def edit
  end

  # POST /horarios or /horarios.json
  def create
    array = params[:horario][:end_time].split(':')
    array2 = params[:horario][:start_time].split(':')
    params[:horario][:end_time] = DateTime.now.change({year: 2100 , hour: (array[0]).to_i + 1 , min: (array[1]).to_i})
    params[:horario][:start_time] = DateTime.now.change({year: 2000 , hour: (array2[0]).to_i , min: (array2[1]).to_i})
    @horario = Horario.new(horario_params)
    respond_to do |format|
      if @horario.save
        format.html { redirect_to horario_url(@horario), notice: "Horario guardado correctamente." }
        format.json { render :show, status: :created, location: @horario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1 or /horarios/1.json
  def update
    array = params[:horario][:end_time].split(':')
    array2 = params[:horario][:start_time].split(':')
    params[:horario][:end_time] = DateTime.now.change({year: 2100 , hour: (array[0]).to_i + 1 , min: (array[1]).to_i})
    params[:horario][:start_time] = DateTime.now.change({year: 2000 , hour: (array2[0]).to_i , min: (array2[1]).to_i})
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to horario_url(@horario), notice: "Horario actualizado correctamente." }
        format.json { render :show, status: :ok, location: @horario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1 or /horarios/1.json
  def destroy
    @horario.destroy

    respond_to do |format|
      format.html { redirect_to horarios_url, notice: "Horario eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def horario_params
      params.require(:horario).permit(:title, :categoria, :lugar, :dia, :start_time, :end_time)
    end
end
