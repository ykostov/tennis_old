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
    def mount(params, %{"admin_token" => admin_token} = session, socket) do
    gladiator = Tours.get_gladiator!(params["id"])
    players = Players.list_players()
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
