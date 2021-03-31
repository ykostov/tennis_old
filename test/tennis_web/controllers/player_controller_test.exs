defmodule TennisWeb.PlayerControllerTest do
  use TennisWeb.ConnCase

  alias Tennis.Players

  @create_attrs %{email: "some email", name: "some name", nickname: "some nickname"}
  @update_attrs %{email: "some updated email", name: "some updated name", nickname: "some updated nickname"}
  @invalid_attrs %{email: nil, name: nil, nickname: nil}

  def fixture(:player) do
    {:ok, player} = Players.create_player(@create_attrs)
    player
  end

  describe "index" do
    test "lists all players", %{conn: conn} do
      conn = get(conn, Routes.player_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Players"
    end
  end

  describe "new player" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.player_path(conn, :new))
      assert html_response(conn, 200) =~ "New Player"
    end
  end

  describe "create player" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.player_path(conn, :create), player: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.player_path(conn, :show, id)

      conn = get(conn, Routes.player_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Player"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.player_path(conn, :create), player: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Player"
    end
  end

  describe "edit player" do
    setup [:create_player]

    test "renders form for editing chosen player", %{conn: conn, player: player} do
      conn = get(conn, Routes.player_path(conn, :edit, player))
      assert html_response(conn, 200) =~ "Edit Player"
    end
  end

  describe "update player" do
    setup [:create_player]

    test "redirects when data is valid", %{conn: conn, player: player} do
      conn = put(conn, Routes.player_path(conn, :update, player), player: @update_attrs)
      assert redirected_to(conn) == Routes.player_path(conn, :show, player)

      conn = get(conn, Routes.player_path(conn, :show, player))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, player: player} do
      conn = put(conn, Routes.player_path(conn, :update, player), player: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Player"
    end
  end

  describe "delete player" do
    setup [:create_player]

    test "deletes chosen player", %{conn: conn, player: player} do
      conn = delete(conn, Routes.player_path(conn, :delete, player))
      assert redirected_to(conn) == Routes.player_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.player_path(conn, :show, player))
      end
    end
  end

  defp create_player(_) do
    player = fixture(:player)
    %{player: player}
  end
end
