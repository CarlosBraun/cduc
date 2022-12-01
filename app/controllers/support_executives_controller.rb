class SupportExecutivesController < ApplicationController
  before_action :set_support_executive, only: %i[ show edit update destroy ]

  # GET /support_executives or /support_executives.json
  def index
    @support_executives = SupportExecutive.all
  end

  # GET /support_executives/1 or /support_executives/1.json
  def show
    @sp = SupportExecutive.find(params[:id])
    @total = Ticket.where(support_executive_id: @support_executive.id).count
    @abiertos = Ticket.where(support_executive_id: @sp.id, state: ["Open","Reopened"]).count
    @cerrados = Ticket.where(support_executive_id: @sp.id, state: "Closed").count
    temp = Ticket.where(support_executive_id: @sp.id, state: "Closed")
    temp1 = []
    temp.each do |t|
      if t.rating != nil
        temp1.append(t.rating)
      end
    end
    if temp1.count == 0
      @promedio = "Dont exist enough calification to calculate the raiting"
    else
      @promedio = temp1.instance_eval { reduce(:+) / size.to_f }
    end
  end

  # GET /support_executives/new
  def new
    @support_executive = SupportExecutive.new
  end

  # GET /support_executives/1/edit
  def edit
  end

  # POST /support_executives or /support_executives.json
  def create
    @support_executive = SupportExecutive.new(support_executive_params)

    respond_to do |format|
      if @support_executive.save
        format.html { redirect_to support_executive_url(@support_executive), notice: "Support executive was successfully created." }
        format.json { render :show, status: :created, location: @support_executive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_executives/1 or /support_executives/1.json
  def update
    respond_to do |format|
      if @support_executive.update(support_executive_params)
        format.html { redirect_to support_executive_url(@support_executive), notice: "Support executive was successfully updated." }
        format.json { render :show, status: :ok, location: @support_executive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_executives/1 or /support_executives/1.json
  def destroy
    @support_executive.destroy

    respond_to do |format|
      format.html { redirect_to support_executives_url, notice: "Support executive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_executive
      @support_executive = SupportExecutive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_executive_params
      params.fetch(:support_executive, {})
    end
end
