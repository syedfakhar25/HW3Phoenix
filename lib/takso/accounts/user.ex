defmodule Takso.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :age, :integer  # Ensure age is included here

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :age])  # Include age in the cast
    |> validate_required([:name, :username, :password, :age])  # Ensure age is required
    |> validate_number(:age, greater_than: 0, message: "must be a positive number")  # Ensure age is a positive integer
  end
end
