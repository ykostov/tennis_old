defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  def render(assigns) do
   render GladiatorsView, "show.html", assigns
  end

end
