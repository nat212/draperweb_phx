defmodule DraperwebPhx.BudgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DraperwebPhx.Budgets` context.
  """

  @doc """
  Generate a unique budget date.
  """
  def unique_budget_date do
    Date.utc_today()
  end

  @doc """
  Generate a budget.
  """
  def monthly_budget_fixture(date \\ unique_budget_date()) do
    {:ok, budget} =
      date
      |> DraperwebPhx.Budgets.create_monthly_budget()

    budget
  end

  def experimental_budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> DraperwebPhx.Budgets.create_experimental_budget()

    budget
  end
end
