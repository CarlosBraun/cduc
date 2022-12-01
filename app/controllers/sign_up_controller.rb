class SignUpController < ApplicationController
  before_action :set_sign_up, only: %i[ show edit update destroy ]

  # GET /sign_up or /sign_up.json
  def index
    @sign_up = SignUp.all
  end

  # GET /sign_up/1 or /sign_up/1.json
  def show
  end

  # GET /sign_up/new
  def new
    @sign_up = SignUp.new
  end

  # GET /sign_up/1/edit
  def edit
  end

  # POST /sign_up or /sign_up.json
  def create
    @sign_up = SignUp.new(sign_up_params)

    respond_to do |format|
      if @sign_up.save
        format.html { redirect_to sign_up_url(@sign_up), notice: "Sign up was successfully created." }
        format.json { render :show, status: :created, location: @sign_up }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_up/1 or /sign_up/1.json
  def update
    respond_to do |format|
      if @sign_up.update(sign_up_params)
        format.html { redirect_to sign_up_url(@sign_up), notice: "Sign up was successfully updated." }
        format.json { render :show, status: :ok, location: @sign_up }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_up/1 or /sign_up/1.json
  def destroy
    @sign_up.destroy

    respond_to do |format|
      format.html { redirect_to sign_up_index_url, notice: "Sign up was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_up
      @sign_up = SignUp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sign_up_params
      params.fetch(:sign_up, {})
    end
end
