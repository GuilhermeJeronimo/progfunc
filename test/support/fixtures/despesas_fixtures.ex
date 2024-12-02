defmodule Financeiro.DespesasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Financeiro.Despesas` context.
  """

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-12-01],
        descricao: "some descricao",
        valor: "120.5"
      })
      |> Financeiro.Despesas.create_despesa()

    despesa
  end
end
