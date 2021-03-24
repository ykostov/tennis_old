defmodule TennisWeb.GladiatorControllerTest do
  use TennisWeb.ConnCase

  alias Tennis.Tours

  @create_attrs %{description: "some description", start_date: ~N[2010-04-17 14:00:00], title: "some title"}
  @update_attrs %{description: "some updated description", start_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
  @invalid_attrs %{description: nil, start_date: nil, title: nil}

  def fixture(:gladiator) do
    {:ok, gladiator} = Tours.create_gladiator(@create_attrs)
    gladiator
  end

  describe "index" do
    test "lists all gladiators", %{conn: conn} do
      conn = get(conn, Routes.gladiator_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Gladiators"
    end
  end

  describe "new gladiator" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.gladiator_path(conn, :new))
      assert html_response(conn, 200) =~ "New Gladiator"
    end
  end

  describe "create gladiator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gladiator_path(conn, :create), gladiator: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.gladiator_path(conn, :show, id)

      conn = get(conn, Routes.gladiator_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Gladiator"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gladiator_path(conn, :create), gladiator: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Gladiator"
    end
  end

  describe "edit gladiator" do
    setup [:create_gladiator]

    test "renders form for editing chosen gladiator", %{conn: conn, gladiator: gladiator} do
      conn = get(conn, Routes.gladiator_path(conn, :edit, gladiator))
      assert html_response(conn, 200) =~ "Edit Gladiator"
    end
  end

  describe "update gladiator" do
    setup [:create_gladiator]

    test "redirects when data is valid", %{conn: conn, gladiator: gladiator} do
      conn = put(conn, Routes.gladiator_path(conn, :update, gladiator), gladiator: @update_attrs)
      assert redirected_to(conn) == Routes.gladiator_path(conn, :show, gladiator)

      conn = get(conn, Routes.gladiator_path(conn, :show, gladiator))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, gladiator: gladiator} do
      conn = put(conn, Routes.gladiator_path(conn, :update, gladiator), gladiator: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Gladiator"
    end
  end

  describe "delete gladiator" do
    setup [:create_gladiator]

    test "deletes chosen gladiator", %{conn: conn, gladiator: gladiator} do
      conn = delete(conn, Routes.gladiator_path(conn, :delete, gladiator))
      assert redirected_to(conn) == Routes.gladiator_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.gladiator_path(conn, :show, gladiator))
      end
    end
  end

  defp create_gladiator(_) do
    gladiator = fixture(:gladiator)
    %{gladiator: gladiator}
  end
end
