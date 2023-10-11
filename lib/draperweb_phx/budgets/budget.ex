defmodule DraperwebPhx.Budgets.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budgets" do
    field :date, :date
    field :experimental, :boolean, default: false
    field :slug, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:date, :slug, :experimental, :name])
    |> validation()
    |> unique_constraint(:slug)
    |> unique_constraint(:date)
  end

  @doc false
  defp validation(budget) do
    if budget[:experimental] do
      budget
      |> validate_required([:slug, :name])
    else
      budget
      |> validate_required([:slug, :date])
    end
  end
end
