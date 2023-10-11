defmodule DraperwebPhx.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :date, :date, null: true
      add :slug, :string, null: true
      add :experimental, :boolean, default: false, null: false
      add :name, :string, null: true

      timestamps()
    end

    create unique_index(:budgets, [:slug])
    create unique_index(:budgets, [:date])
  end
end
