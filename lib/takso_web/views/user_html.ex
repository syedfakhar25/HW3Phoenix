defmodule TaksoWeb.UserHTML do
  use TaksoWeb, :html

  def index(assigns) do
    ~H"""
    <.header>
      Listing Users
      <:actions>
        <.link href={~p"/users/new"}>
          <.button>New User</.button>
        </.link>
      </:actions>
    </.header>

    <.table id="users" rows={@users}>
      <:col :let={user} label="Name"><%= user.name %></:col>
      <:col :let={user} label="Username"><%= user.username %></:col>
      <:col :let={user} label="Password"><%= user.password %></:col>
    </.table>
    """
  end

  def new(assigns) do
    ~H"""
    <.header>
      New User
    </.header>

    <.form for={@changeset} action={~p"/users"} method="post">
      <.input field={@changeset[:name]} label="Name" />
      <.input field={@changeset[:username]} label="Username" />
      <.input field={@changeset[:password]} label="Password" type="password" />
      <.button>Save User</.button>
    </.form>
    """
  end
end
