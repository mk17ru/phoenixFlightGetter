defmodule ProjectWeb.FlightController do
  use ProjectWeb, :controller

  alias Project.Management
  alias Project.Management.Flight

  action_fallback ProjectWeb.FallbackController

  def index(conn, _params) do
    flights = Management.list_flights()
    render(conn, "index.json", flights: flights)
  end

  def create(conn, %{"flight" => flight_params}) do
    with {:ok, %Flight{} = flight} <- Management.create_flight(flight_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.flight_path(conn, :show, flight))
      |> render("show.json", flight: flight)
    end
  end

  def show(conn, %{"id" => id}) do
    flight = Management.get_flight!(id)
    render(conn, "show.json", flight: flight)
  end

  def update(conn, %{"id" => id, "flight" => flight_params}) do
    flight = Management.get_flight!(id)

    with {:ok, %Flight{} = flight} <- Management.update_flight(flight, flight_params) do
      render(conn, "show.json", flight: flight)
    end
  end

  def delete(conn, %{"id" => id}) do
    flight = Management.get_flight!(id)

    with {:ok, %Flight{}} <- Management.delete_flight(flight) do
      send_resp(conn, :no_content, "")
    end
  end
end
