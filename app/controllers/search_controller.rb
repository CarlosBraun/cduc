class SearchController < ApplicationController
  def search
    @jugadors = Jugador.all

    logger.debug(render_to_string layout: "search")
    render layout: "search"
  end
end
