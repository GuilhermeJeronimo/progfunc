defmodule Financeiro.ReceitasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Financeiro.Receitas` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-11-30],
        descricao: "some descricao",
        valor: "120.5"
      })
      |> Financeiro.Receitas.create_receita()

    receita
  end

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-12-01],
        descricao: "some descricao",
        valor: "120.5"
      })
      |> Financeiro.Receitas.create_receita()

    receita
  end
end
