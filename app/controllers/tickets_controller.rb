class TicketsController < ApplicationController
  before_action :check_log, :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    if !user_signed_in?
      return redirect_to root_path
    end
    if $masterauth
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]

      @prio.each do |p|
        tickets = Ticket.where(priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_ticket.append(tick)
        end
      end
      @open_ticket.each do |y|
        if @open_tickets.length == 0
          @open_tickets.append(y)
        end
        (0..(@open_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @open_tickets[k].created_at.to_date
            @open_tickets.insert(k,y)
          elsif (@open_tickets.length == k +1) and (y.created_at.to_date <= @open_tickets[k].created_at.to_date)
            @open_tickets.append(y)
          else

          end 
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_ticket.append(tick)
        end
      end
      @closed_ticket.each do |y|
        if @closed_tickets.length == 0
          @closed_tickets.append(y)
        end
        (0..(@closed_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @closed_tickets[k].created_at.to_date
            @closed_tickets.insert(k,y)
          elsif (@closed_tickets.length == k +1) and (y.created_at.to_date <= @closed_tickets[k].created_at.to_date)
            @closed_tickets.append(y)
          else

          end 
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end

    if $lowauth and not $masterauth
      email = current_user.email
      id = SupportExecutive.where(email: email).map { |x| x.id }
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]

      @prio.each do |p|
        tickets = Ticket.where(support_executive_id: id, priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_ticket.append(tick)
        end
      end
      @open_ticket.each do |y|
        if @open_tickets.length == 0
          @open_tickets.append(y)
        end
        (0..(@open_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @open_tickets[k].created_at.to_date
            @open_tickets.insert(k,y)
          elsif (@open_tickets.length == k +1) and (y.created_at.to_date <= @open_tickets[k].created_at.to_date)
            @open_tickets.append(y)
          else

          end 
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_ticket.append(tick)
        end
      end
      @closed_ticket.each do |y|
        if @closed_tickets.length == 0
          @closed_tickets.append(y)
        end
        (0..(@closed_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @closed_tickets[k].created_at.to_date
            @closed_tickets.insert(k,y)
          elsif (@closed_tickets.length == k +1) and (y.created_at.to_date <= @closed_tickets[k].created_at.to_date)
            @closed_tickets.append(y)
          else

          end 
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end

    if not($masterauth or $lowauth)
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]

      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_ticket.append(tick)
        end
      end
      @open_ticket.each do |y|
        if @open_tickets.length == 0
          @open_tickets.append(y)
        end
        (0..(@open_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @open_tickets[k].created_at.to_date
            @open_tickets.insert(k,y)
          elsif (@open_tickets.length == k +1) and (y.created_at.to_date <= @open_tickets[k].created_at.to_date)
            @open_tickets.append(y)
          else

          end 
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_ticket.append(tick)
        end
      end
      @closed_ticket.each do |y|
        if @closed_tickets.length == 0
          @closed_tickets.append(y)
        end
        (0..(@closed_tickets.length - 1)).each do |k|
          if y.created_at.to_date > @closed_tickets[k].created_at.to_date
            @closed_tickets.insert(k,y)
          elsif (@closed_tickets.length == k +1) and (y.created_at.to_date <= @closed_tickets[k].created_at.to_date)
            @closed_tickets.append(y)
          else

          end 
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end
  end

  def sort_priority
    if !user_signed_in?
      return redirect_to root_path
    end
    if $masterauth
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]

      @prio.each do |p|
        tickets = Ticket.where(priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_tickets.append(tick)
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_tickets.append(tick)
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end

    if $lowauth and not $masterauth
      email = current_user.email
      id = SupportExecutive.where(email: email).map { |x| x.id }
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]
      @prio.each do |p|
        tickets = Ticket.where(support_executive_id: id, priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_tickets.append(tick)
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_tickets.append(tick)
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end

    if not($masterauth or $lowauth)
      @open_ticket = []
      @open_tickets = []
      @closed_ticket = []
      @closed_tickets = []
      @prio = ["Urgent","High","Normal", "Low"]
      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: ["Open","Reopened"])
        tickets.each do |tick|
          @open_tickets.append(tick)
        end
      end
      @open_tickets = @open_tickets.uniq
      @prio.each do |p|
        tickets = Ticket.where(user_id: current_user.id, priority: p, state: "Closed")
        tickets.each do |tick|
          @closed_tickets.append(tick)
        end
      end
      @closed_tickets = @closed_tickets.uniq
    end
  end
  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @incident = Incident.find(@ticket.incident_id)
    @sp = SupportExecutive.find(@ticket.support_executive_id)
    @comments = []
    tempn = 1
    temp = Comment.all
    temp.each do |t|
      if t.ticket_id == @ticket.id
        @comments.append("Comment "+ (tempn).to_s + " : " + t.comment)
        tempn = tempn + 1
      end  
    end
    $tempuid = @ticket.id


  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @se_list = SupportExecutive.ids
    @se_count = []
    for i in @se_list
      @se_count.append(Ticket.where(support_executive_id: i).count)
    end
    temp = @se_count.min
    @indexx = @se_count.find_index(temp)
    @se = SupportExecutive.find(@indexx)
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @se_list = SupportExecutive.ids
    @se_count = []
    for i in @se_list
      @se_count.append(Ticket.where(support_executive_id: i).count)
    end
    temp = @se_count.min
    indexx = @se_count.find_index(temp)

    @se_count = []
    @ticket = Ticket.new(ticket_params)
    @incident = Incident.new(@ticket.incident)
    @incident.creation_date = @incident.created_at
    @incident.save
    @ticket = Ticket.new(ticket_params)
    @ticket.support_executive_id = indexx
    @ticket.user_id = current_user.id
    @ticket.incident_id = Incident.last.id
    @ticket.state = "Open"
    

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to edit_incident_url(@incident), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def close_ticket
    @ticket = Ticket.find(params[:id])
    @ticket.update(state: "Closed")
    flash[:notice] = "Ticket closed succesfully"
    redirect_back(fallback_location: root_path)
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def check_log
      if !user_signed_in?
        redirect_back(fallback_location: root_path)
      end
    end
    # Only allow a list of trusted parameters through.
    def ticket_params
      params.fetch(:ticket, {}).permit(:id, :priority, :rating, :state, :resolution, :response, :tags, :docs, :support_executive_id, :user_id, :flyer, :incident_id,  
      comment_attributes: [:id],
      incident_attributes:[:id],
      support_executive_attributes:[:id])
    end
end
