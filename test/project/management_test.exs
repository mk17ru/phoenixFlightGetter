defmodule Project.ManagementTest do
  use Project.DataCase

  alias Project.Management

  describe "flights" do
    alias Project.Management.Flight

    @valid_attrs %{arrivalDate: "some arrivalDate", arrivalTime: "some arrivalTime", departureDate: "some departureDate", departureTime: "some departureTime", destination: "some destination", id: 42, number: "some number", origin: "some origin"}
    @update_attrs %{arrivalDate: "some updated arrivalDate", arrivalTime: "some updated arrivalTime", departureDate: "some updated departureDate", departureTime: "some updated departureTime", destination: "some updated destination", id: 43, number: "some updated number", origin: "some updated origin"}
    @invalid_attrs %{arrivalDate: nil, arrivalTime: nil, departureDate: nil, departureTime: nil, destination: nil, id: nil, number: nil, origin: nil}

    def flight_fixture(attrs \\ %{}) do
      {:ok, flight} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_flight()

      flight
    end

    test "list_flights/0 returns all flights" do
      flight = flight_fixture()
      assert Management.list_flights() == [flight]
    end

    test "get_flight!/1 returns the flight with given id" do
      flight = flight_fixture()
      assert Management.get_flight!(flight.id) == flight
    end

    test "create_flight/1 with valid data creates a flight" do
      assert {:ok, %Flight{} = flight} = Management.create_flight(@valid_attrs)
      assert flight.arrivalDate == "some arrivalDate"
      assert flight.arrivalTime == "some arrivalTime"
      assert flight.departureDate == "some departureDate"
      assert flight.departureTime == "some departureTime"
      assert flight.destination == "some destination"
      assert flight.id == 42
      assert flight.number == "some number"
      assert flight.origin == "some origin"
    end

    test "create_flight/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_flight(@invalid_attrs)
    end

    test "update_flight/2 with valid data updates the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{} = flight} = Management.update_flight(flight, @update_attrs)
      assert flight.arrivalDate == "some updated arrivalDate"
      assert flight.arrivalTime == "some updated arrivalTime"
      assert flight.departureDate == "some updated departureDate"
      assert flight.departureTime == "some updated departureTime"
      assert flight.destination == "some updated destination"
      assert flight.id == 43
      assert flight.number == "some updated number"
      assert flight.origin == "some updated origin"
    end

    test "update_flight/2 with invalid data returns error changeset" do
      flight = flight_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_flight(flight, @invalid_attrs)
      assert flight == Management.get_flight!(flight.id)
    end

    test "delete_flight/1 deletes the flight" do
      flight = flight_fixture()
      assert {:ok, %Flight{}} = Management.delete_flight(flight)
      assert_raise Ecto.NoResultsError, fn -> Management.get_flight!(flight.id) end
    end

    test "change_flight/1 returns a flight changeset" do
      flight = flight_fixture()
      assert %Ecto.Changeset{} = Management.change_flight(flight)
    end
  end
end
