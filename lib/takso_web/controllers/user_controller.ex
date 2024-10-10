defmodule TaksoWeb.UserController do
  use TaksoWeb, :controller

  alias Takso.Accounts
  alias Takso.Accounts.User
  alias Takso.Repo

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"user" => user_params}) do
  #   changeset = User.changeset(%User{}, user_params)

  #   case Repo.insert(changeset) do  # Use Repo directly
  #     {:ok, _user} ->
  #       redirect(conn, to: Routes.user_path(conn, :index))

  #     {:error, changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

end
