class NoticiaController < ApplicationController
  before_action :set_noticium, only: %i[ show edit update destroy ]

  # GET /noticia or /noticia.json
  def index
    @noticia = Noticium.all
  end

  # GET /noticia/1 or /noticia/1.json
  def show
  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia or /noticia.json
  def create
    @noticium = Noticium.new(noticium_params)

    respond_to do |format|
      if @noticium.save
        format.html { redirect_to noticium_url(@noticium), notice: "Noticium was successfully created." }
        format.json { render :show, status: :created, location: @noticium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticia/1 or /noticia/1.json
  def update
    respond_to do |format|
      if @noticium.update(noticium_params)
        format.html { redirect_to noticium_url(@noticium), notice: "Noticium was successfully updated." }
        format.json { render :show, status: :ok, location: @noticium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1 or /noticia/1.json
  def destroy
    @noticium.destroy

    respond_to do |format|
      format.html { redirect_to noticia_url, notice: "Noticium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      @noticium = Noticium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def noticium_params
      params.fetch(:noticium, {})
    end
end
