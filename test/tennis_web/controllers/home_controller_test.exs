defmodule TennisWeb.HomeControllerTest do
  use TennisWeb.ConnCase

  alias Tennis.Pages

  @create_attrs %{email: "some email", name: "some name", text: "some text"}
  @update_attrs %{email: "some updated email", name: "some updated name", text: "some updated text"}
  @invalid_attrs %{email: nil, name: nil, text: nil}

  def fixture(:home) do
    {:ok, home} = Pages.create_home(@create_attrs)
    home
  end

  describe "index" do
    test "lists all homes", %{conn: conn} do
      conn = get(conn, Routes.home_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Homes"
    end
  end

  describe "new home" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.home_path(conn, :new))
      assert html_response(conn, 200) =~ "New Home"
    end
  end

  describe "create home" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.home_path(conn, :create), home: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.home_path(conn, :show, id)

      conn = get(conn, Routes.home_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Home"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.home_path(conn, :create), home: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Home"
    end
  end

  describe "edit home" do
    setup [:create_home]

    test "renders form for editing chosen home", %{conn: conn, home: home} do
      conn = get(conn, Routes.home_path(conn, :edit, home))
      assert html_response(conn, 200) =~ "Edit Home"
    end
  end

  describe "update home" do
    setup [:create_home]

    test "redirects when data is valid", %{conn: conn, home: home} do
      conn = put(conn, Routes.home_path(conn, :update, home), home: @update_attrs)
      assert redirected_to(conn) == Routes.home_path(conn, :show, home)

      conn = get(conn, Routes.home_path(conn, :show, home))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, home: home} do
      conn = put(conn, Routes.home_path(conn, :update, home), home: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Home"
    end
  end

  describe "delete home" do
    setup [:create_home]

    test "deletes chosen home", %{conn: conn, home: home} do
      conn = delete(conn, Routes.home_path(conn, :delete, home))
      assert redirected_to(conn) == Routes.home_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.home_path(conn, :show, home))
      end
    end
  end

  defp create_home(_) do
    home = fixture(:home)
    %{home: home}
  end
end
