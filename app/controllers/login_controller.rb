class LoginController < ApplicationController
  before_action :set_login, only: %i[ show edit update destroy ]

  # GET /login or /login.json
  def index
    @login = @current_user
  end

  # GET /login/1 or /login/1.json
  def show
  end

  # GET /login/new
  def new
    @login = Login.new
  end

  # GET /login/1/edit
  def edit
  end

  # POST /login or /login.json
  def create
    @login = Login.new(login_params)

    respond_to do |format|
      if @login.save
        format.html { redirect_to login_url(@login), notice: "Login was successfully created." }
        format.json { render :show, status: :created, location: @login }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login/1 or /login/1.json
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to login_url(@login), notice: "Login was successfully updated." }
        format.json { render :show, status: :ok, location: @login }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login/1 or /login/1.json
  def destroy
    @login.destroy

    respond_to do |format|
      format.html { redirect_to login_index_url, notice: "Login was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def login_params
      params.fetch(:login, {})
    end
end
