class UsersController < ApplicationController
  before_action :check_log, :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if !user_signed_in?
      return redirect_to root_path
    end
    @users = User.all
    semails = []
    seids = []
    n= 0
    @numeros = []
    @se_all = []
    temp = SupportExecutive.all
    temp.each do |x|
      semails.append(x.email)
      seids.append(x.id)

    end
    @lista = []
    @users.each do |y|
      if y.email == Supervisor.first.email
        @lista.append("Supervisor")
        @se_all.append("")
      elsif semails.include?(y.email)
        @lista.append("Support Executive")
        @se_all.append(semails.find_index(y.email))
      else
        @lista.append("User")
        @se_all.append("")
      end
      @numeros.append(n)
      n=n+1
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @current_user = @user
    $current_user = @current_user
    @ticketsnumber = Ticket.where("user_id = ?", @user.id).count()
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created. Already Loged In." }
        format.json { render :show, status: :created, location: @user }
        @current_user = @user
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_executive
    user = User.find(params[:id])
    SupportExecutive.create! :name => user.name, :last_name => user.last_name, :email => user.email, :encrypted_password => user.encrypted_password, :telephone => user.telephone, :supervisor_id => 1
    flash[:notice] = "Support Executive added"
    redirect_back(fallback_location: users_path)
  end

  def remove_executive
    user = User.find(params[:id])
    
    se = SupportExecutive.all
    mails = []
    se.each do |t|
      mails.append(t.email)
    end
    temp = mails.find_index(user.email)
    ser = SupportExecutive.find(temp+1)
    ser.destroy
    flash[:notice] = "Support Executive removed"
    redirect_back(fallback_location: users_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    def check_log
      if !user_signed_in?
        redirect_back(fallback_location: root_path)
      end
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:id, :name, :last_name, :email, :telephone, :flyer, :encrypted_password)
    end
end
