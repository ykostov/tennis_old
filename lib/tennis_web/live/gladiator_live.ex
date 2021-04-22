defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  alias TennisWeb.GladiatorView
  alias Tennis.Players
  alias Tennis.Accounts
  alias Tennis.Tours
  alias Tennis.Players.Player

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

  def handle_event("toggle_done", %{"id" => id}, socket) do
    player = Players.get_player!(id)
    Players.update_player(player, %{done: !player.done})
    {:noreply, socket}
  end

  def handle_event("toggle_check", %{"id" => id}, socket) do
    player_id = Players.get_player!(id)
    gladiator = Tours.get_gladiator!(id)
    Tours.upsert_gladiator_player(gladiator, player_id)
    {:noreply, socket}
  end


end
