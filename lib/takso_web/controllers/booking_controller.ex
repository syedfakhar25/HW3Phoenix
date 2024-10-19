
defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Takso.Repo
  alias Takso.Sales.Taxi

  def new(conn, _params) do
    render conn, "new.html"
  end
  def index(conn, _params) do
    render(conn, "index.html")
  end
  def create(conn, %{"booking" => booking_params}) do
    pickup_address = booking_params["pickup_address"]
    dropoff_address = booking_params["dropoff_address"]

    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)


    if length(available_taxis) > 0 do
      arrival_time = Enum.random(5..15)
      conn
      |> put_flash(:info, "Your taxi will arrive in #{arrival_time} minutes")
      |> redirect(to: Routes.booking_path(conn, :index))
    else
      conn
      |> put_flash(:error, "No taxis are available at the moment")
      |> redirect(to: Routes.booking_path(conn, :index))
    end
  end
end
