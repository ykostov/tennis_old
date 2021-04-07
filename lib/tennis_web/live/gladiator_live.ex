defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  alias Tennis.Players

  def render(assigns) do
   render GladiatorsView, "show.html", assigns
  end

  @impl true
  def mount(params, %{"admin_token" => admin_token} = session, socket) do
    gladiator = Tours.get_gladiators!(params["id"])
    players = Players.list_players
    admin = Accounts.get_admin_by_session_token(admin_token)
    socket = assign(
        socket,
        gladiator: gladiator,
        players: players,
        current_admin: admin
      )
    {:ok, socket}
  end

end
