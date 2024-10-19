defmodule Takso.Sales.BookingTest do
  use Takso.DataCase, async: true
  alias Takso.Sales.Booking

  test "booking requires a 'pickup address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: nil, dropoff_address: "Liivi 2"})
    assert Keyword.has_key?(changeset.errors, :pickup_address)
  end

  test "booking requires a 'dropoff address'" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Riia 4", dropoff_address: nil})
    assert Keyword.has_key?(changeset.errors, :dropoff_address)
  end

  test "booking is valid with both addresses" do
    changeset = Booking.changeset(%Booking{}, %{pickup_address: "Riia 4", dropoff_address: "Liivi 2"})
    assert changeset.valid?
  end
end
