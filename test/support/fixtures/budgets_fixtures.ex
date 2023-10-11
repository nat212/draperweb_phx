defmodule DraperwebPhx.BudgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DraperwebPhx.Budgets` context.
  """

  @doc """
  Generate a unique budget date.
  """
  def unique_budget_date do
    raise "implement the logic to generate a unique budget date"
  end

  @doc """
  Generate a unique budget slug.
  """
  def unique_budget_slug, do: "some slug#{System.unique_integer([:positive])}"

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        date: unique_budget_date(),
        experimental: true,
        slug: unique_budget_slug()
      })
      |> DraperwebPhx.Budgets.create_budget()

    budget
  end
end
