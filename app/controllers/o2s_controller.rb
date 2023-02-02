class O2sController < ApplicationController
  before_action :set_o2, only: %i[ show edit update destroy ]

  # GET /o2s or /o2s.json
  def index
    @o2s = O2.all
  end

  # GET /o2s/1 or /o2s/1.json
  def show
    @info= []
  end

  # GET /o2s/new
  def new
    @o2 = O2.new
    if params[:view] == "12"
      render 'new12'
    elsif params[:view] == "20"
      render 'new20'
    else
      render 'new14'
    end
  end

  # GET /o2s/1/edit
  def edit
  end

  # POST /o2s or /o2s.json
  def create
    @o2 = O2.new(o2_params)

    respond_to do |format|
      if @o2.save
        format.html { redirect_to o2_url(@o2), notice: "O2 was successfully created." }
        format.json { render :show, status: :created, location: @o2 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @o2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /o2s/1 or /o2s/1.json
  def update
    respond_to do |format|
      if @o2.update(o2_params)
        format.html { redirect_to o2_url(@o2), notice: "O2 was successfully updated." }
        format.json { render :show, status: :ok, location: @o2 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @o2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /o2s/1 or /o2s/1.json
  def destroy
    @o2.destroy

    respond_to do |format|
      format.html { redirect_to o2s_url, notice: "O2 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_o2
      @o2 = O2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def o2_params
      params.fetch(:o2, {}).permit(:title, :torneo, :categoria, :fecha, :j1, :j2, :j3, :j4, :j5, :j6, :j7, :j8, :j9, :j10, :j11, :j12, :j13, :j14, :j15, :j16, :j17, :j18, :j19, :j20, :e1, :e2, :e3, :es1, :pf1, :med_kine1)
    end
end
