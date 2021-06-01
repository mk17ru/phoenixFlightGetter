defmodule Project.Repo.Migrations.CreateFlights do
  use Ecto.Migration

  def change do
    create table(:flights) do
      add :origin, :string
      add :destination, :string
      add :departureDate, :string
      add :departureTime, :string
      add :arrivalDate, :string
      add :arrivalTime, :string
      add :number, :string
      timestamps()
    end

  end
end

