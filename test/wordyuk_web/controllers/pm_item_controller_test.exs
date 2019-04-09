defmodule WordyukWeb.PMItemControllerTest do
  use WordyukWeb.ConnCase

  alias Wordyuk.Lexicon

  @create_attrs %{auc_item: "some auc_item", esp_glss: "some esp_glss", pos: "some pos", que_gloss: "some que_gloss", reference: "some reference"}
  @update_attrs %{auc_item: "some updated auc_item", esp_glss: "some updated esp_glss", pos: "some updated pos", que_gloss: "some updated que_gloss", reference: "some updated reference"}
  @invalid_attrs %{auc_item: nil, esp_glss: nil, pos: nil, que_gloss: nil, reference: nil}

  def fixture(:pm_item) do
    {:ok, pm_item} = Lexicon.create_pm_item(@create_attrs)
    pm_item
  end

  describe "index" do
    test "lists all pmitems", %{conn: conn} do
      conn = get(conn, Routes.pm_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pmitems"
    end
  end

  describe "new pm_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pm_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pm item"
    end
  end

  describe "create pm_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pm_item_path(conn, :create), pm_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pm_item_path(conn, :show, id)

      conn = get(conn, Routes.pm_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pm item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pm_item_path(conn, :create), pm_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pm item"
    end
  end

  describe "edit pm_item" do
    setup [:create_pm_item]

    test "renders form for editing chosen pm_item", %{conn: conn, pm_item: pm_item} do
      conn = get(conn, Routes.pm_item_path(conn, :edit, pm_item))
      assert html_response(conn, 200) =~ "Edit Pm item"
    end
  end

  describe "update pm_item" do
    setup [:create_pm_item]

    test "redirects when data is valid", %{conn: conn, pm_item: pm_item} do
      conn = put(conn, Routes.pm_item_path(conn, :update, pm_item), pm_item: @update_attrs)
      assert redirected_to(conn) == Routes.pm_item_path(conn, :show, pm_item)

      conn = get(conn, Routes.pm_item_path(conn, :show, pm_item))
      assert html_response(conn, 200) =~ "some updated auc_item"
    end

    test "renders errors when data is invalid", %{conn: conn, pm_item: pm_item} do
      conn = put(conn, Routes.pm_item_path(conn, :update, pm_item), pm_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pm item"
    end
  end

  describe "delete pm_item" do
    setup [:create_pm_item]

    test "deletes chosen pm_item", %{conn: conn, pm_item: pm_item} do
      conn = delete(conn, Routes.pm_item_path(conn, :delete, pm_item))
      assert redirected_to(conn) == Routes.pm_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pm_item_path(conn, :show, pm_item))
      end
    end
  end

  defp create_pm_item(_) do
    pm_item = fixture(:pm_item)
    {:ok, pm_item: pm_item}
  end
end
