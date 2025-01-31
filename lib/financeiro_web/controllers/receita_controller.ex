defmodule FinanceiroWeb.ReceitaController do
  use FinanceiroWeb, :controller

  alias Financeiro.Receitas
  alias Financeiro.Receitas.Receita

  def index(conn, _params) do
    receitas = Receitas.list_receitas()
    render(conn, :index, receitas: receitas)
  end

  def new(conn, _params) do
    changeset = Receitas.change_receita(%Receita{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Receitas.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita created successfully.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receita = Receitas.get_receita!(id)
    render(conn, :show, receita: receita)
  end

  def edit(conn, %{"id" => id}) do
    receita = Receitas.get_receita!(id)
    changeset = Receitas.change_receita(receita)
    render(conn, :edit, receita: receita, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Receitas.get_receita!(id)

    case Receitas.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Receitas.get_receita!(id)
    {:ok, _receita} = Receitas.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: ~p"/receitas")
  end
end
