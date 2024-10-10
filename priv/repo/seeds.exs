alias Takso.{Repo, Accounts.User}

[%{name: "Dio Brando", username: "DIO", password: "itsmedio"},
 %{name: "Jotaro Kujo", username: "JoJo", password: "oraoraora"}]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)
