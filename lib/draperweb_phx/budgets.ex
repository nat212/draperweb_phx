defmodule DraperwebPhx.Budgets do
  @moduledoc """
  The Budgets context.
  """

  import Ecto.Query, warn: false
  alias DraperwebPhx.Repo

  alias DraperwebPhx.Budgets.Budget

  @doc """
  Returns the list of budgets.

  ## Examples

      iex> list_budgets()
      [%Budget{}, ...]

  """
  def list_budgets do
    Repo.all(Budget)
  end

  @doc """
  Gets a single budget.

  Raises `Ecto.NoResultsError` if the Budget does not exist.

  ## Examples

      iex> get_budget!(123)
      %Budget{}

      iex> get_budget!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget!(id), do: Repo.get!(Budget, id)

  defp create_budget(attrs) do
    %Budget{}
    |> Budget.changeset(attrs)
    |> Repo.insert()
  end

  defp sluggify(string) do
    string
    |> String.trim()
    |> String.downcase()
    |> String.replace(~R"\s+", "-")
  end

  def create_experimental_budget(attrs \\ %{}) do
    attrs
    |> Map.merge(%{
      experimental: true,
      name: attrs[:name] |> String.trim(),
      slug: attrs[:name] |> sluggify(),
      date: nil
    })
    |> create_budget()
  end

  def create_monthly_budget(date \\ Date.utc_today()) do
    %{
      experimental: false,
      date: date |> Date.beginning_of_month(),
      slug: date |> Calendar.strftime("%B-%Y") |> String.downcase(),
      name: date |> Calendar.strftime("%B %Y")
    }
    |> create_budget()
  end

  @doc """
  Updates a budget.

  ## Examples

      iex> update_budget(budget, %{field: new_value})
      {:ok, %Budget{}}

      iex> update_budget(budget, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget(%Budget{} = budget, attrs) do
    budget
    |> Budget.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget.

  ## Examples

      iex> delete_budget(budget)
      {:ok, %Budget{}}

      iex> delete_budget(budget)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget(%Budget{} = budget) do
    Repo.delete(budget)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget changes.

  ## Examples

      iex> change_budget(budget)
      %Ecto.Changeset{data: %Budget{}}

  """
  def change_budget(%Budget{} = budget, attrs \\ %{}) do
    Budget.changeset(budget, attrs)
  end
end
