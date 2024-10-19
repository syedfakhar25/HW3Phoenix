defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
  def index(conn, _params) do
    render(conn, "index.html")
  end
  def create(conn, %{"booking" => booking_params}) do
    pickup_address = booking_params["pickup_address"]
    dropoff_address = booking_params["dropoff_address"]

    # Mock logic for calculating taxi arrival time (for now, it can be a fixed value or a random one)
    arrival_time = Enum.random(5..15)

    # Put a flash message with the taxi arrival information
    conn
      |> put_flash(:info, "Your taxi will arrive in #{arrival_time} minutes")
      |> redirect(to: Routes.booking_path(conn, :index))
  end
end
