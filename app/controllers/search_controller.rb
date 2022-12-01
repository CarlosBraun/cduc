class SearchController < ApplicationController
  def search
    @tickets = Ticket.where("id LIKE ? or tags LIKE ?",
                          "%#{Ticket.sanitize_sql_like(params[:q])}%",
                          "%#{Ticket.sanitize_sql_like(params[:q])}%")

    logger.debug(render_to_string layout: "search")
    render layout: "search"
  end
end
