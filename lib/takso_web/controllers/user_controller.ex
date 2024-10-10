defmodule TaksoWeb.UserController do
  use TaksoWeb, :controller
  alias Takso.Repo
  alias Takso.Accounts.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end


  #new
  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  #create
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    Repo.insert(changeset)
    redirect(conn, to: ~p"/users")
  end

  #edit
  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, %{})
    render(conn, "edit.html", user: user, changeset: changeset)
  end
  #update
  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    Repo.update(changeset)
    redirect(conn, to: ~p"/users")
  end

end
