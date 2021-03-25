defmodule Tennis.ToursTest do
  use Tennis.DataCase

  alias Tennis.Tours

  describe "gladiators" do
    alias Tennis.Tours.Gladiator

    @valid_attrs %{description: "some description", start_date: ~N[2010-04-17 14:00:00], title: "some title"}
    @update_attrs %{description: "some updated description", start_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
    @invalid_attrs %{description: nil, start_date: nil, title: nil}

    def gladiator_fixture(attrs \\ %{}) do
      {:ok, gladiator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tours.create_gladiator()

      gladiator
    end

    test "list_gladiators/0 returns all gladiators" do
      gladiator = gladiator_fixture()
      assert Tours.list_gladiators() == [gladiator]
    end

    test "get_gladiator!/1 returns the gladiator with given id" do
      gladiator = gladiator_fixture()
      assert Tours.get_gladiator!(gladiator.id) == gladiator
    end

    test "create_gladiator/1 with valid data creates a gladiator" do
      assert {:ok, %Gladiator{} = gladiator} = Tours.create_gladiator(@valid_attrs)
      assert gladiator.description == "some description"
      assert gladiator.start_date == ~N[2010-04-17 14:00:00]
      assert gladiator.title == "some title"
    end

    test "create_gladiator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tours.create_gladiator(@invalid_attrs)
    end

    test "update_gladiator/2 with valid data updates the gladiator" do
      gladiator = gladiator_fixture()
      assert {:ok, %Gladiator{} = gladiator} = Tours.update_gladiator(gladiator, @update_attrs)
      assert gladiator.description == "some updated description"
      assert gladiator.start_date == ~N[2011-05-18 15:01:01]
      assert gladiator.title == "some updated title"
    end

    test "update_gladiator/2 with invalid data returns error changeset" do
      gladiator = gladiator_fixture()
      assert {:error, %Ecto.Changeset{}} = Tours.update_gladiator(gladiator, @invalid_attrs)
      assert gladiator == Tours.get_gladiator!(gladiator.id)
    end

    test "delete_gladiator/1 deletes the gladiator" do
      gladiator = gladiator_fixture()
      assert {:ok, %Gladiator{}} = Tours.delete_gladiator(gladiator)
      assert_raise Ecto.NoResultsError, fn -> Tours.get_gladiator!(gladiator.id) end
    end

    test "change_gladiator/1 returns a gladiator changeset" do
      gladiator = gladiator_fixture()
      assert %Ecto.Changeset{} = Tours.change_gladiator(gladiator)
    end
  end
end
