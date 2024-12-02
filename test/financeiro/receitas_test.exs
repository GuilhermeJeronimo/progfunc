defmodule Financeiro.ReceitasTest do
  use Financeiro.DataCase

  alias Financeiro.Receitas

  describe "receitas" do
    alias Financeiro.Receitas.Receita

    import Financeiro.ReceitasFixtures

    @invalid_attrs %{data: nil, descricao: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Receitas.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Receitas.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{data: ~D[2024-11-30], descricao: "some descricao", valor: "120.5"}

      assert {:ok, %Receita{} = receita} = Receitas.create_receita(valid_attrs)
      assert receita.data == ~D[2024-11-30]
      assert receita.descricao == "some descricao"
      assert receita.valor == Decimal.new("120.5")
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receitas.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{data: ~D[2024-12-01], descricao: "some updated descricao", valor: "456.7"}

      assert {:ok, %Receita{} = receita} = Receitas.update_receita(receita, update_attrs)
      assert receita.data == ~D[2024-12-01]
      assert receita.descricao == "some updated descricao"
      assert receita.valor == Decimal.new("456.7")
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Receitas.update_receita(receita, @invalid_attrs)
      assert receita == Receitas.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Receitas.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Receitas.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Receitas.change_receita(receita)
    end
  end

  describe "receitas" do
    alias Financeiro.Receitas.Receita

    import Financeiro.ReceitasFixtures

    @invalid_attrs %{data: nil, descricao: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Receitas.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Receitas.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{data: ~D[2024-12-01], descricao: "some descricao", valor: "120.5"}

      assert {:ok, %Receita{} = receita} = Receitas.create_receita(valid_attrs)
      assert receita.data == ~D[2024-12-01]
      assert receita.descricao == "some descricao"
      assert receita.valor == Decimal.new("120.5")
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receitas.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{data: ~D[2024-12-02], descricao: "some updated descricao", valor: "456.7"}

      assert {:ok, %Receita{} = receita} = Receitas.update_receita(receita, update_attrs)
      assert receita.data == ~D[2024-12-02]
      assert receita.descricao == "some updated descricao"
      assert receita.valor == Decimal.new("456.7")
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Receitas.update_receita(receita, @invalid_attrs)
      assert receita == Receitas.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Receitas.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Receitas.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Receitas.change_receita(receita)
    end
  end
end
