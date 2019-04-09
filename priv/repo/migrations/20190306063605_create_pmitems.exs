defmodule Wordyuk.Repo.Migrations.CreatePmitems do
  use Ecto.Migration

  def change do
    create table(:pmitems) do
      add :auc_item, :string
      add :esp_gloss, :string
      add :que_gloss, :string
      add :reference, :string
      add :pos, :string

      timestamps()
    end

  end
end
