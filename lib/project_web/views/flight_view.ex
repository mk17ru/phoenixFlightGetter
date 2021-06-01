defmodule ProjectWeb.FlightView do
  use ProjectWeb, :view
  use JaSerializer.PhoenixView

  attributes [:origin, :destination, :departureDate, :departureTime, :arrivalDate, :arrivalTime, :number]
#  alias ProjectWeb.FlightView

#  def render("index.json", %{flights: flights}) do
#    %{data: render_many(flights, FlightView, "flight.json")}
#  end
#
#  def render("show.json", %{flight: flight}) do
#    %{data: render_one(flight, FlightView, "flight.json")}
#  end
#
#  def render("flight.json", %{flight: flight}) do
#    %{
#      id: flight.id,
#      origin: flight.origin,
#      destination: flight.destination,
#      departureDate: flight.departureDate,
#      departureTime: flight.departureTime,
#      arrivalDate: flight.arrivalDate,
#      arrivalTime: flight.arrivalTime,
#      number: flight.number}
#  end
end
