class ShoppingCartController < ApplicationController
  # GET /shopping_cart/1
  # GET /shopping_cart/1.json
  def show
    @info = []
    @items = []
    @total = 0
    cart = get_cart_items()
    ids = cart.keys
    cantidad = cart.values
    name_events = []
    tt_names = []
    tt_prices = []
    for i in (0...ids.size)
      ticket = TicketType.find(ids[i])
      tt_names.append(ticket.name)
      tt_prices.append(ticket.price)
      evento = Event.find(ticket.event_id)
      name_events.append(evento.name)
    end
    for i in (0...ids.size)
      @info.append([name_events[i],tt_names[i],cantidad[i],cantidad[i]*tt_prices[i],ids[i]])
      @total += cantidad[i]*tt_prices[i]
    end

    # The following Will simply redirect to the referer,
    # or to the root path as fallback location.
    # redirect_back(fallback_location: root_path)
  end

  def add
    # Puts a message in the flash
    begin
      cart = get_cart_items()
      if  not cart.key?(params[:ticket_type_id]) 
        cart[params[:ticket_type_id]]=1
        flash[:notice] = "Ticket succesfully added to your shopping cart!"
      
      else
        numero = cart[params[:ticket_type_id]]
        cart[params[:ticket_type_id]] = numero + 1
        flash[:notice] = "Ticket succesfully added to your shopping cart! N° of this ticket in the cart : " + String(cart[params[:ticket_type_id]])
      end
      update_cart(cart)
      # Will simply redirect to the referer, or to
      # the root path as fallback location.
      redirect_back(fallback_location: root_path)
    rescue
      flash[:alert] = "Has ocurred an error addind the ticket (ticket id = "+ params[:ticket_type_id]+") to the shopping cart."
      redirect_back(fallback_location: root_path)
    end
  end

  def remove
    begin
      cart = get_cart_items()
      if  cart[params[:ticket_type_id]]==1
        cart.delete(params[:ticket_type_id])
        flash[:notice] = "Ticket succesfully removed from the shopping cart!"
      
      else
        numero = cart[params[:ticket_type_id]]
        cart[params[:ticket_type_id]] = numero - 1
        flash[:notice] = "Ticket succesfully removed from shopping cart! N° of this ticket remaining in the cart : " + String(cart[params[:ticket_type_id]])
      end
      update_cart(cart)
      # Will simply redirect to the referer, or to
      # the root path as fallback location.
      redirect_back(fallback_location: root_path)
    rescue
      flash[:alert] = "Has ocurred an error removing the ticket (ticket id = "+ params[:ticket_type_id]+") from the shopping cart."
      redirect_back(fallback_location: root_path)
    end
  end

  def zap
    # If there is a shopping cart cookie available
    if cookies.has_key?(:shopping_cart)
      # delete it
      cookies.delete(:shopping_cart)
    end
    # Redirect to the referer or root path
    redirect_back(fallback_location: root_path)
  end

  private

  # This will serialize the current cart state
  # and store it in the cookie
  def update_cart(items)
    cookies[:shopping_cart] = JSON.generate(items)
  end

  # This will de-serialize the current cart state
  # from the cookie store and return it
  def get_cart_items
    cart = {}
    if cookies.has_key?(:shopping_cart)
      cart = JSON.parse(cookies[:shopping_cart])
    else
      update_cart({})
    end
    cart
  end
end
