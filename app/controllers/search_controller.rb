class SearchController < ApplicationController
  def search
    @jugadors = Jugador.where("id LIKE ? or tags LIKE ?",
                          "%#{Jugador.sanitize_sql_like(params[:q])}%",
                          "%#{Jugador.sanitize_sql_like(params[:q])}%")

    logger.debug(render_to_string layout: "search")
    render layout: "search"
  end
end
