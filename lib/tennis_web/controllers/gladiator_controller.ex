defmodule TennisWeb.GladiatorController do
  use TennisWeb, :controller

  alias Tennis.Tours
  alias Tennis.Tours.Gladiator

  def index(conn, _params) do
    gladiators = Tours.list_gladiators()
    render(conn, "index.html", gladiators: gladiators)
  end

  def new(conn, _params) do
    changeset = Tours.change_gladiator(%Gladiator{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gladiator" => gladiator_params}) do
    case Tours.create_gladiator(gladiator_params) do
      {:ok, gladiator} ->
        conn
        |> put_flash(:info, "Gladiator created successfully.")
        |> redirect(to: Routes.gladiator_path(conn, :show, gladiator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gladiator = Tours.get_gladiator!(id)
    render(conn, "show.html", gladiator: gladiator)
  end

  def edit(conn, %{"id" => id}) do
    gladiator = Tours.get_gladiator!(id)
    changeset = Tours.change_gladiator(gladiator)
    render(conn, "edit.html", gladiator: gladiator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gladiator" => gladiator_params}) do
    gladiator = Tours.get_gladiator!(id)

    case Tours.update_gladiator(gladiator, gladiator_params) do
      {:ok, gladiator} ->
        conn
        |> put_flash(:info, "Gladiator updated successfully.")
        |> redirect(to: Routes.gladiator_path(conn, :show, gladiator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", gladiator: gladiator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gladiator = Tours.get_gladiator!(id)
    {:ok, _gladiator} = Tours.delete_gladiator(gladiator)

    conn
    |> put_flash(:info, "Gladiator deleted successfully.")
    |> redirect(to: Routes.gladiator_path(conn, :index))
  end
end
