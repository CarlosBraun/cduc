class EnamesController < ApplicationController
  before_action :set_ename, only: %i[ show edit update destroy ]

  # GET /enames or /enames.json
  def index
    @enames = Ename.all
  end

  # GET /enames/1 or /enames/1.json
  def show
  end

  # GET /enames/new
  def new
    @ename = Ename.new
  end

  # GET /enames/1/edit
  def edit
  end

  # POST /enames or /enames.json
  def create
    @ename = Ename.new(ename_params)

    respond_to do |format|
      if @ename.save
        format.html { redirect_to ename_url(@ename), notice: "Ename was successfully created." }
        format.json { render :show, status: :created, location: @ename }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ename.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enames/1 or /enames/1.json
  def update
    respond_to do |format|
      if @ename.update(ename_params)
        format.html { redirect_to ename_url(@ename), notice: "Ename was successfully updated." }
        format.json { render :show, status: :ok, location: @ename }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ename.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enames/1 or /enames/1.json
  def destroy
    @ename.destroy

    respond_to do |format|
      format.html { redirect_to enames_url, notice: "Ename was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ename
      @ename = Ename.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ename_params
      params.fetch(:ename, {})
    end
end
