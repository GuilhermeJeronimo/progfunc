defmodule FinanceiroWeb.DespesaController do
  use FinanceiroWeb, :controller

  alias Financeiro.Despesas
  alias Financeiro.Despesas.Despesa

  def index(conn, _params) do
    despesas = Despesas.list_despesas()
    render(conn, :index, despesas: despesas)
  end

  def new(conn, _params) do
    changeset = Despesas.change_despesa(%Despesa{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"despesa" => despesa_params}) do
    case Despesas.create_despesa(despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa created successfully.")
        |> redirect(to: ~p"/despesas/#{despesa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesa = Despesas.get_despesa!(id)
    render(conn, :show, despesa: despesa)
  end

  def edit(conn, %{"id" => id}) do
    despesa = Despesas.get_despesa!(id)
    changeset = Despesas.change_despesa(despesa)
    render(conn, :edit, despesa: despesa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesa" => despesa_params}) do
    despesa = Despesas.get_despesa!(id)

    case Despesas.update_despesa(despesa, despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa updated successfully.")
        |> redirect(to: ~p"/despesas/#{despesa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, despesa: despesa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesa = Despesas.get_despesa!(id)
    {:ok, _despesa} = Despesas.delete_despesa(despesa)

    conn
    |> put_flash(:info, "Despesa deleted successfully.")
    |> redirect(to: ~p"/despesas")
  end
end
