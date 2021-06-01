# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Project.Repo.insert!(%Project.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Project.Management.Flight
alias Project.Repo

defmodule Project.Seeds do

  def store_it(row) do
    changeset = Flight.changeset(%Flight{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("./priv/repo/seeds/data.csv")
|> Stream.drop(1)
|> CSV.decode(headers: [:id, :origin, :destination, :departureDate, :departureTime, :arrivalDate, :arrivalTime, :number])
|> Enum.each(&Project.Seeds.store_it/1)