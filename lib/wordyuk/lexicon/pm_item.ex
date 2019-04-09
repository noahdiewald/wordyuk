defmodule Wordyuk.Lexicon.PMItem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pmitems" do
    field :auc_item, :string
    field :esp_gloss, :string
    field :pos, :string
    field :que_gloss, :string
    field :reference, :string

    timestamps()
  end

  @doc false
  def changeset(pm_item, attrs) do
    pm_item
    |> cast(attrs, [:auc_item, :esp_gloss, :que_gloss, :reference, :pos])
    |> validate_required([:auc_item, :esp_gloss, :que_gloss, :reference, :pos])
  end
end
