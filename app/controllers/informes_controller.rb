class InformesController < ApplicationController
  before_action :set_informe, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @informes = Informe.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @informe = Informe.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @informe = Informe.new(informe_params)
    respond_to do |format|
      if @informe.save
        format.html { redirect_to informe_url(@informe), notice: "Informe actualizado de forma correcta." }
        format.json { render :show, status: :created, location: @informe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @informe.update(comment_params)
        format.html { redirect_to ticket_url(@informe), notice: "Informe actualizado de forma correcta." }
        format.json { render :show, status: :ok, location: @informe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @informe.destroy

    respond_to do |format|
      format.html { redirect_to informes_url, notice: "Informe eliminado de forma exitosa." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe
      @informe = Informe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def informe_params
      params.fetch(:informe, {}).permit(:id, :comment, :tipo)
    end
end
