class JugadorsController < ApplicationController
  before_action :set_jugador, only: %i[ show edit update destroy ]

  # GET /jugadors or /jugadors.json
  def index
    if params[:view].present?
      @pagy, @jugadors = pagy(Jugador.where(categoria: params[:view]))
    else
      @pagy, @jugadors = pagy(Jugador.all)
      render 'index'
    end
  end

  # GET /jugadors/1 or /jugadors/1.json
  def show
  end

  # GET /jugadors/new
  def new
    @jugador = Jugador.new
  end

  # GET /jugadors/1/edit
  def edit
  end

  def search
    if  params[:search].blank?
      redirect_to jugadors_path and return
    else
      @parameter = params[:search].downcase
      @jugadors = Jugador.where("lower(name) LIKE ? or lower(last_name1) LIKE ? or lower(categoria) LIKE ? or lower(posicion) LIKE ?",
        "%#{@parameter}%",
        "%#{@parameter}%",
        "%#{@parameter}%",
        "%#{@parameter}%")
    end
  end

  # POST /jugadors or /jugadors.json
  def create
    params[:jugador][:fullname] = params[:jugador][:name] +" "+params[:jugador][:name2] +" "+params[:jugador][:last_name1] +" "+params[:jugador][:last_name2]
    @jugador = Jugador.new(jugador_params)

    respond_to do |format|
      if @jugador.save
        
        format.html { redirect_to jugador_url(@jugador), notice: "Jugador was successfully created." }
        format.json { render :show, status: :created, location: @jugador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jugadors/1 or /jugadors/1.json
  def update
    respond_to do |format|
      params[:jugador][:fullname] = params[:jugador][:name] +" "+params[:jugador][:name2] +" "+params[:jugador][:last_name1] +" "+params[:jugador][:last_name2]
      if @jugador.update(jugador_params)
        format.html { redirect_to jugador_url(@jugador), notice: "Jugador was successfully updated." }
        format.json { render :show, status: :ok, location: @jugador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jugadors/1 or /jugadors/1.json
  def destroy
    @jugador.destroy

    respond_to do |format|
      format.html { redirect_to jugadors_url, notice: "Jugador was successfully destroyed." }
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
      params.fetch(:jugador, {}).permit(:id, :name, :last_name1, :mail,:posicion, :categoria, :fecha , :telephone, :avatar, :fullname, :name2, :last_name2, :rut, :genero)
    end
end
