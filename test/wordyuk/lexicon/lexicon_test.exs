defmodule Wordyuk.LexiconTest do
  use Wordyuk.DataCase

  alias Wordyuk.Lexicon

  describe "pmitems" do
    alias Wordyuk.Lexicon.PMItem

    @valid_attrs %{auc_item: "some auc_item", esp_glss: "some esp_glss", pos: "some pos", que_gloss: "some que_gloss", reference: "some reference"}
    @update_attrs %{auc_item: "some updated auc_item", esp_glss: "some updated esp_glss", pos: "some updated pos", que_gloss: "some updated que_gloss", reference: "some updated reference"}
    @invalid_attrs %{auc_item: nil, esp_glss: nil, pos: nil, que_gloss: nil, reference: nil}

    def pm_item_fixture(attrs \\ %{}) do
      {:ok, pm_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lexicon.create_pm_item()

      pm_item
    end

    test "list_pmitems/0 returns all pmitems" do
      pm_item = pm_item_fixture()
      assert Lexicon.list_pmitems() == [pm_item]
    end

    test "get_pm_item!/1 returns the pm_item with given id" do
      pm_item = pm_item_fixture()
      assert Lexicon.get_pm_item!(pm_item.id) == pm_item
    end

    test "create_pm_item/1 with valid data creates a pm_item" do
      assert {:ok, %PMItem{} = pm_item} = Lexicon.create_pm_item(@valid_attrs)
      assert pm_item.auc_item == "some auc_item"
      assert pm_item.esp_glss == "some esp_glss"
      assert pm_item.pos == "some pos"
      assert pm_item.que_gloss == "some que_gloss"
      assert pm_item.reference == "some reference"
    end

    test "create_pm_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lexicon.create_pm_item(@invalid_attrs)
    end

    test "update_pm_item/2 with valid data updates the pm_item" do
      pm_item = pm_item_fixture()
      assert {:ok, %PMItem{} = pm_item} = Lexicon.update_pm_item(pm_item, @update_attrs)
      assert pm_item.auc_item == "some updated auc_item"
      assert pm_item.esp_glss == "some updated esp_glss"
      assert pm_item.pos == "some updated pos"
      assert pm_item.que_gloss == "some updated que_gloss"
      assert pm_item.reference == "some updated reference"
    end

    test "update_pm_item/2 with invalid data returns error changeset" do
      pm_item = pm_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Lexicon.update_pm_item(pm_item, @invalid_attrs)
      assert pm_item == Lexicon.get_pm_item!(pm_item.id)
    end

    test "delete_pm_item/1 deletes the pm_item" do
      pm_item = pm_item_fixture()
      assert {:ok, %PMItem{}} = Lexicon.delete_pm_item(pm_item)
      assert_raise Ecto.NoResultsError, fn -> Lexicon.get_pm_item!(pm_item.id) end
    end

    test "change_pm_item/1 returns a pm_item changeset" do
      pm_item = pm_item_fixture()
      assert %Ecto.Changeset{} = Lexicon.change_pm_item(pm_item)
    end
  end
end
