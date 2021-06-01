defmodule Project.Management.Flight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "flights" do
    field :arrivalDate, :string
    field :arrivalTime, :string
    field :departureDate, :string
    field :departureTime, :string
    field :destination, :string
    field :number, :string
    field :origin, :string
    @primary_key {:id, :binary_id, autogenerate: true}
    timestamps()
  end

  @doc false
  def changeset(flight, attrs) do
    flight
    |> cast(attrs, [:id, :origin, :destination, :departureDate, :departureTime, :arrivalDate, :arrivalTime, :number])
    |> validate_required([:id, :origin, :destination, :departureDate, :departureTime, :arrivalDate, :arrivalTime, :number])
  end
end
