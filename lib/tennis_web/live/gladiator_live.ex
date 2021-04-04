defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  alias TennisWeb.GladiatorsView
  alias TennisWeb.PlayersView
  alias TennisWeb.Home
  alias TennisWeb.Accounts

  def render(assigns) do
   render GladiatorsView, "show.html", assigns
  end

  @impl true
  def mount(params, %{"admin_token" => admin_token} = session, socket) do
    gladiator = Home.get_gladiator!(params["id"])
    players = Players.list_players
    admin = Accounts.get_admin_by_session_token(admin_token)
    socket = assign(
        socket,
        gladiators: gladiator,
        players: players,
        current_admin: admin
      )
    {:ok, socket}
  end
end
