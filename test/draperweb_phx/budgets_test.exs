defmodule DraperwebPhx.BudgetsTest do
  use DraperwebPhx.DataCase

  alias DraperwebPhx.Budgets

  describe "budgets" do
    alias DraperwebPhx.Budgets.Budget

    import DraperwebPhx.BudgetsFixtures

    @invalid_attrs %{date: nil, experimental: nil, slug: nil}

    test "list_budgets/0 returns all budgets" do
      budget = budget_fixture()
      assert Budgets.list_budgets() == [budget]
    end

    test "get_budget!/1 returns the budget with given id" do
      budget = budget_fixture()
      assert Budgets.get_budget!(budget.id) == budget
    end

    test "create_budget/1 with valid data creates a budget" do
      valid_attrs = %{date: ~D[2023-10-09], experimental: true, slug: "some slug"}

      assert {:ok, %Budget{} = budget} = Budgets.create_budget(valid_attrs)
      assert budget.date == ~D[2023-10-09]
      assert budget.experimental == true
      assert budget.slug == "some slug"
    end

    test "create_budget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_budget(@invalid_attrs)
    end

    test "update_budget/2 with valid data updates the budget" do
      budget = budget_fixture()
      update_attrs = %{date: ~D[2023-10-10], experimental: false, slug: "some updated slug"}

      assert {:ok, %Budget{} = budget} = Budgets.update_budget(budget, update_attrs)
      assert budget.date == ~D[2023-10-10]
      assert budget.experimental == false
      assert budget.slug == "some updated slug"
    end

    test "update_budget/2 with invalid data returns error changeset" do
      budget = budget_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_budget(budget, @invalid_attrs)
      assert budget == Budgets.get_budget!(budget.id)
    end

    test "delete_budget/1 deletes the budget" do
      budget = budget_fixture()
      assert {:ok, %Budget{}} = Budgets.delete_budget(budget)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_budget!(budget.id) end
    end

    test "change_budget/1 returns a budget changeset" do
      budget = budget_fixture()
      assert %Ecto.Changeset{} = Budgets.change_budget(budget)
    end
  end
end
