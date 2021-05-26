defmodule TennisWeb.TourLive do
  use TennisWeb, :live_view

  alias TennisWeb.TourView
  alias Tennis.Players
  alias Tennis.Accounts
  alias Tennis.Tours
  alias Tennis.Repo
  alias Tennis.Tours.Tour


  def render(assigns) do
   render TourView, "show.html", assigns
  end

  @impl true
  def mount(params, %{"admin_token" => admin_token} = session, socket) do
    tour = Tours.get_tour!(params["id"])
    players = Players.list_players()
    tour_players = tour.players
                   |>Enum.map(fn(x) -> x.id end)

    admin = Accounts.get_admin_by_session_token(admin_token)
    socket = assign(
        socket,
        tour: tour,
        players: players,
        tour_players: tour_players,
        current_admin: admin

      )
    {:ok, socket}
  end

  def handle_event("toggle_check", %{"player-id" => player_id}, socket) do
    tour = socket.assigns[:tour]
              |> Repo.preload(:players)
    Tours.toggle_player_tour(tour, player_id)
    tour_players = tour.players
                   |>Enum.map(fn(x) -> x.id end)
                   {:noreply, assign(socket, :tour_players, tour_players)}
  end



end
