defmodule Takso.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :password, :string
      add :age, :integer

      timestamps(type: :utc_datetime)
    end
  end
  def change do
    alter table(:users) do
      add :age, :integer
    end
  end
end
