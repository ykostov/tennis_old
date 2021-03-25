defmodule TennisWeb.HomeController do
  use TennisWeb, :controller

  alias Tennis.Pages
  alias Tennis.Pages.Home

  def index(conn, _params) do
    homes = Pages.list_homes()
    render(conn, "index.html", homes: homes)
  end

  def new(conn, _params) do
    changeset = Pages.change_home(%Home{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"home" => home_params}) do
    case Pages.create_home(home_params) do
      {:ok, home} ->
        conn
        |> put_flash(:info, "Home created successfully.")
        |> redirect(to: Routes.home_path(conn, :show, home))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    home = Pages.get_home!(id)
    render(conn, "show.html", home: home)
  end

  def edit(conn, %{"id" => id}) do
    home = Pages.get_home!(id)
    changeset = Pages.change_home(home)
    render(conn, "edit.html", home: home, changeset: changeset)
  end

  def update(conn, %{"id" => id, "home" => home_params}) do
    home = Pages.get_home!(id)

    case Pages.update_home(home, home_params) do
      {:ok, home} ->
        conn
        |> put_flash(:info, "Home updated successfully.")
        |> redirect(to: Routes.home_path(conn, :show, home))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", home: home, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    home = Pages.get_home!(id)
    {:ok, _home} = Pages.delete_home(home)

    conn
    |> put_flash(:info, "Home deleted successfully.")
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
