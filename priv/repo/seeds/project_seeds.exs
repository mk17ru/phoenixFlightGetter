alias Project.Repo
alias Project.Management.Flight

Repo.insert! %Flight{
  origin: "SVO",
  destination: "BKK",
  departureDate: "20210701",
  departureTime: "2010",
  arrivalDate: "20210702",
  arrivalTime: "1115",
  number: "SU-276"
}

