defmodule Takso.Sales.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :pickup_address, :string
    field :dropoff_address, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, params \\ %{}) do
    booking
    |> cast(params, [:pickup_address, :dropoff_address])
    |> validate_required([:pickup_address, :dropoff_address])
  end
end
