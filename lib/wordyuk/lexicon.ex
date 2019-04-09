defmodule Wordyuk.Lexicon do
  @moduledoc """
  The Lexicon context.
  """

  import Ecto.Query, warn: false
  alias Wordyuk.Repo

  alias Wordyuk.Lexicon.PMItem

  @doc """
  Returns the list of pmitems.

  ## Examples

      iex> list_pmitems()
      [%PMItem{}, ...]

  """
  def list_pmitems do
    Repo.all(PMItem)
  end

  @doc """
  Gets a single pm_item.

  Raises `Ecto.NoResultsError` if the Pm item does not exist.

  ## Examples

      iex> get_pm_item!(123)
      %PMItem{}

      iex> get_pm_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pm_item!(id), do: Repo.get!(PMItem, id)

  @doc """
  Creates a pm_item.

  ## Examples

      iex> create_pm_item(%{field: value})
      {:ok, %PMItem{}}

      iex> create_pm_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pm_item(attrs \\ %{}) do
    %PMItem{}
    |> PMItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pm_item.

  ## Examples

      iex> update_pm_item(pm_item, %{field: new_value})
      {:ok, %PMItem{}}

      iex> update_pm_item(pm_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pm_item(%PMItem{} = pm_item, attrs) do
    pm_item
    |> PMItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PMItem.

  ## Examples

      iex> delete_pm_item(pm_item)
      {:ok, %PMItem{}}

      iex> delete_pm_item(pm_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pm_item(%PMItem{} = pm_item) do
    Repo.delete(pm_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pm_item changes.

  ## Examples

      iex> change_pm_item(pm_item)
      %Ecto.Changeset{source: %PMItem{}}

  """
  def change_pm_item(%PMItem{} = pm_item) do
    PMItem.changeset(pm_item, %{})
  end
end
