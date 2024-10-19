alias Takso.{Repo, Accounts.User}


%Taxi{username: "Taxi1", location: "Location1", status: "available"}
|> Taxi.changeset()
|> Repo.insert!()

%Taxi{username: "Taxi2", location: "Location2", status: "busy"}
|> Taxi.changeset()
|> Repo.insert!()

%Taxi{username: "Taxi3", location: "Location3", status: "available"}
|> Taxi.changeset()
|> Repo.insert!()
