defmodule Tennis.PagesTest do
  use Tennis.DataCase

  alias Tennis.Pages

  describe "homes" do
    alias Tennis.Pages.Home

    @valid_attrs %{email: "some email", name: "some name", text: "some text"}
    @update_attrs %{email: "some updated email", name: "some updated name", text: "some updated text"}
    @invalid_attrs %{email: nil, name: nil, text: nil}

    def home_fixture(attrs \\ %{}) do
      {:ok, home} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pages.create_home()

      home
    end

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Pages.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Pages.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      assert {:ok, %Home{} = home} = Pages.create_home(@valid_attrs)
      assert home.email == "some email"
      assert home.name == "some name"
      assert home.text == "some text"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pages.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      assert {:ok, %Home{} = home} = Pages.update_home(home, @update_attrs)
      assert home.email == "some updated email"
      assert home.name == "some updated name"
      assert home.text == "some updated text"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Pages.update_home(home, @invalid_attrs)
      assert home == Pages.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Pages.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Pages.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Pages.change_home(home)
    end
  end
end
