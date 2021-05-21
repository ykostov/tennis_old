defmodule TennisWeb.GladiatorLive do
  use TennisWeb, :live_view

  alias TennisWeb.GladiatorView
  alias Tennis.Players
  alias Tennis.Accounts
  alias Tennis.Tours
  alias Tennis.Repo
  alias Tennis.Tours.Gladiator


  def render(assigns) do
   render GladiatorView, "show.html", assigns
  end

  @impl true
    def mount(params, %{"admin_token" => admin_token} = session, socket) do
    gladiator = Tours.get_gladiator!(params["id"])
    players = Players.list_players()
    gladiator_players = Tours.player_tour(tour)
                  |>Enum.map(fn(x) -> x.player_id end)
    admin = Accounts.get_admin_by_session_token(admin_token)
    socket = assign(
        socket,
        gladiator: gladiator,
        players: players,
        gladiator_players: gladiator_players,
        current_admin: admin

      )
    {:ok, socket}
  end

  def handle_event("toggle_check", %{"player-id" => player_id}, socket) do
    gladiator = socket.assigns[:gladiator]
              |> Repo.preload(:players)
    Tours.toggle_gladiators_players(gladiator, player_id)
    {:noreply, socket}
  end

end
