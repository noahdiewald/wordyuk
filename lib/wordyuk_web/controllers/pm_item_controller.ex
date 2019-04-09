defmodule WordyukWeb.PMItemController do
  use WordyukWeb, :controller

  alias Wordyuk.Lexicon
  alias Wordyuk.Lexicon.PMItem

  def index(conn, _params) do
    pmitems = Lexicon.list_pmitems()
    render(conn, "index.html", pmitems: pmitems)
  end

  def new(conn, _params) do
    changeset = Lexicon.change_pm_item(%PMItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pm_item" => pm_item_params}) do
    case Lexicon.create_pm_item(pm_item_params) do
      {:ok, pm_item} ->
        conn
        |> put_flash(:info, "Pm item created successfully.")
        |> redirect(to: Routes.pm_item_path(conn, :show, pm_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pm_item = Lexicon.get_pm_item!(id)
    render(conn, "show.html", pm_item: pm_item)
  end

  def edit(conn, %{"id" => id}) do
    pm_item = Lexicon.get_pm_item!(id)
    changeset = Lexicon.change_pm_item(pm_item)
    render(conn, "edit.html", pm_item: pm_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pm_item" => pm_item_params}) do
    pm_item = Lexicon.get_pm_item!(id)

    case Lexicon.update_pm_item(pm_item, pm_item_params) do
      {:ok, pm_item} ->
        conn
        |> put_flash(:info, "Pm item updated successfully.")
        |> redirect(to: Routes.pm_item_path(conn, :show, pm_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pm_item: pm_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pm_item = Lexicon.get_pm_item!(id)
    {:ok, _pm_item} = Lexicon.delete_pm_item(pm_item)

    conn
    |> put_flash(:info, "Pm item deleted successfully.")
    |> redirect(to: Routes.pm_item_path(conn, :index))
  end
end
