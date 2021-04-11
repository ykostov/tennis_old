defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  alias TennisWeb.GladiatorView
  alias Tennis.Players
  alias Tennis.Accounts
  alias Tennis.Tours


  def render(assigns) do
   render GladiatorView, "show.html", assigns
  end

  @impl true
  def mount(params, _session, socket) do
    gladiator = Tours.get_gladiator!(params["id"])
    players = Players.list_players()
    socket = assign(
        socket,
        gladiator: gladiator,
        players: players,

      )
    {:ok, socket}
  end

end
